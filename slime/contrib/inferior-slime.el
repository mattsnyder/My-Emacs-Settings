;;; inferior-slime.el --- Minor mode with Slime keys for comint buffers
;;
;; Author: Luke Gorrie  <luke@synap.se>
;; License: GNU GPL (same license as Emacs)
;;
;;; Installation:
;;
;; Add something like this to your .emacs: 
;;
;;   (add-to-list 'load-path "<directory-of-this-file>")
;;   (add-hook 'slime-load-hook (lambda () (require 'inferior-slime)))
;;   (add-hook 'inferior-lisp-mode-hook (lambda () (inferior-slime-mode 1)))

(define-minor-mode inferior-slime-mode
  "\\<slime-mode-map>\
Inferior SLIME mode: The Inferior Superior Lisp Mode for Emacs.

This mode is intended for use with `inferior-lisp-mode'. It provides a
subset of the bindings from `slime-mode'.

\\{inferior-slime-mode-map}"
  nil
  nil
  ;; Fake binding to coax `define-minor-mode' to create the keymap
  '((" " 'undefined)))

(add-to-list 'minor-mode-alist
             '(inferior-slime-mode
               (" Inf-Slime" slime-state-name)))

(defun inferior-slime-return ()
  "Handle the return key in the inferior-lisp buffer.
The current input should only be sent if a whole expression has been
entered, i.e. the parenthesis are matched.

A prefix argument disables this behaviour."
  (interactive)
  (if (or current-prefix-arg (inferior-slime-input-complete-p))
      (comint-send-input)
    (insert "\n")
    (inferior-slime-indent-line)))

(defun inferior-slime-indent-line ()
  "Indent the current line, ignoring everything before the prompt."
  (interactive)
  (save-restriction
    (let ((indent-start
           (save-excursion
             (goto-char (process-mark (get-buffer-process (current-buffer))))
             (let ((inhibit-field-text-motion t))
               (beginning-of-line 1))
             (point))))
      (narrow-to-region indent-start (point-max)))
    (lisp-indent-line)))

(defun inferior-slime-input-complete-p ()
  "Return true if the input is complete in the inferior lisp buffer."
  (slime-input-complete-p (process-mark (get-buffer-process (current-buffer)))
                          (point-max)))

(defun inferior-slime-closing-return ()
  "Send the current expression to Lisp after closing any open lists."
  (interactive)
  (goto-char (point-max))
  (save-restriction
    (narrow-to-region (process-mark (get-buffer-process (current-buffer)))
                      (point-max))
    (while (ignore-errors (save-excursion (backward-up-list 1) t))
      (insert ")")))
  (comint-send-input))

(defun inferior-slime-init-keymap ()
  (let ((map inferior-slime-mode-map))
    (define-key map [return] 'inferior-slime-return)
    (define-key map [(control return)] 'inferior-slime-closing-return)
    (define-key map [(meta control ?m)] 'inferior-slime-closing-return)
    (define-key map "\C-c\C-d" slime-doc-map)
    (define-key map "\C-c\C-w" slime-who-map)
    (loop for (key command . keys) in slime-keys do
	  (destructuring-bind (&key prefixed inferior &allow-other-keys) keys
	    (when prefixed
	      (setq key (concat slime-prefix-key key)))
	    (when inferior
	      (define-key map key command))))))

(inferior-slime-init-keymap)

(provide 'inferior-slime)
