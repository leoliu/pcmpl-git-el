.PHONY: git-options
EMACS=emacs

git-options: pcmpl-git-parse.el
	$(EMACS) -batch -q -no-site-file -l ./pcmpl-git-parse.el -f git-parse-and-save
