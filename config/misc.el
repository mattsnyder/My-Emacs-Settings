(load-library "open_textmate")
(load-library "wc")
(load-library "window-number")
(load-library "countchars.el")
(load-library "google")
(load-library "fullscreen")
(if (eq use-lambda t)
    (lambda
      (require 'pretty-lambdada)
      (pretty-lambda-for-modes)))
