# Automatically Generated Makefile by EDE.
# For use with: make
#
# DO NOT MODIFY THIS FILE OR YOUR CHANGES MAY BE LOST.
# EDE is the Emacs Development Environment.
# http://cedet.sourceforge.net/ede.shtml
# 

top=
ede_FILES=Project.ede Makefile

example_MISC=semantic-skel.el skeleton.bnf semantic-example.el
init_LISP=semantic-load.el
EMACS=emacs
LOADPATH=../speedbar/ ../eieio/ 
semantic_LISP=semantic.el semantic-util.el semantic-bnf.el semantic-ctxt.el
Languages_LISP=semantic-c.el semantic-el.el semantic-java.el semantic-make.el semantic-scm.el semantic-texi.el
tools_LISP=semantic-imenu.el semantic-sb.el working.el semanticdb.el document.el document-vars.el sformat.el semantic-chart.el semantic-util-modes.el semantic-analyze.el semantic-ia.el semantic-cb.el semantic-ia-sb.el
senator_LISP=senator.el
misc_AUX=INSTALL NEWS ChangeLog
info_TEXINFOS=semantic.texi
MAKEINFO=makeinfo
aux_AUX=c.bnf make.bnf java.bnf scheme.bnf
VERSION=1.4.4
DISTDIR=$(top)semantic-$(VERSION)



all: example semantic Languages tools senator semantic.info Tests

example: 
	@

.PHONY: init
init: $(init_LISP)
	@echo "(add-to-list 'load-path nil)" > $@-compile-script
	for loadpath in . ${LOADPATH}; do \
	   echo "(add-to-list 'load-path \"$$loadpath\")" >> $@-compile-script; \
	done;
	@echo "(setq debug-on-error t)" >> $@-compile-script
	$(EMACS) -batch -l $@-compile-script -f batch-byte-compile $^

.PHONY: semantic
semantic: $(semantic_LISP)
	@echo "(add-to-list 'load-path nil)" > $@-compile-script
	for loadpath in . ${LOADPATH}; do \
	   echo "(add-to-list 'load-path \"$$loadpath\")" >> $@-compile-script; \
	done;
	@echo "(setq debug-on-error t)" >> $@-compile-script
	$(EMACS) -batch -l $@-compile-script -f batch-byte-compile $^

.PHONY: Languages
Languages: $(Languages_LISP)
	@echo "(add-to-list 'load-path nil)" > $@-compile-script
	for loadpath in . ${LOADPATH}; do \
	   echo "(add-to-list 'load-path \"$$loadpath\")" >> $@-compile-script; \
	done;
	@echo "(setq debug-on-error t)" >> $@-compile-script
	$(EMACS) -batch -l $@-compile-script -f batch-byte-compile $^

.PHONY: tools
tools: $(tools_LISP)
	@echo "(add-to-list 'load-path nil)" > $@-compile-script
	for loadpath in . ${LOADPATH}; do \
	   echo "(add-to-list 'load-path \"$$loadpath\")" >> $@-compile-script; \
	done;
	@echo "(setq debug-on-error t)" >> $@-compile-script
	$(EMACS) -batch -l $@-compile-script -f batch-byte-compile $^

.PHONY: senator
senator: $(senator_LISP)
	@echo "(add-to-list 'load-path nil)" > $@-compile-script
	for loadpath in . ${LOADPATH}; do \
	   echo "(add-to-list 'load-path \"$$loadpath\")" >> $@-compile-script; \
	done;
	@echo "(setq debug-on-error t)" >> $@-compile-script
	$(EMACS) -batch -l $@-compile-script -f batch-byte-compile $^

semantic.info: $(info_TEXINFOS)
	$(MAKEINFO) -o $@ $<

.PHONY:Tests
Tests:
	cd tests; $(MAKE)

tags: 
	cd tests/; make $@


clean:
	rm -f *.elc *.html *.info


dist: semantic.info
	rm -rf $(DISTDIR)
	mkdir $(DISTDIR)
	cp $(example_MISC) $(init_LISP) $(semantic_LISP) $(Languages_LISP) $(tools_LISP) $(senator_LISP) $(misc_AUX) $(info_TEXINFOS) semantic.info* $(aux_AUX) $(ede_FILES) $(DISTDIR)
	cd tests; $(MAKE) dist
	tar -cvzf $(DISTDIR).tar.gz $(DISTDIR)
	rm -rf $(DISTDIR)

Makefile: Project.ede
	@echo Makefile is out of date!  It needs to be regenerated by EDE.
	@false



# End of Makefile
