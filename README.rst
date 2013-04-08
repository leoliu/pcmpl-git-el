==========================
 Git Completion for Emacs
==========================
 
Provide completion support for ``git`` in Emacs in places pcomplete is
used (mainly shell/eshell).

install
-------

Place files ``pcmpl-git.el`` and ``git-options`` in ``load-path``.
By default, ``git-options`` will be looked for in the same directory
as ``pcmpl-git.el``. You can put the file ``git-options`` anywhere
and customise ``pcmpl-git-options-file`` to point to it.

File ``pcmpl-git-parse.el`` is not needed for running this package. It
is used for generating ``git-options``.

usage
-----

Complete both git commands and their options and arguments. Type '-'
to complete short options and '--' to complete long options. For
commands that accept commit as argument, branches and tags will be
tried first and then the SHAs in the first few hundred commits.
