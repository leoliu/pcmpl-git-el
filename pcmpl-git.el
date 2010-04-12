;;; pcmpl-git.el --- pcomplete for git

;; Copyright (C) 2010  Leo Shidai Liu

;; Author: Leo Shidai Liu <shidai.liu@gmail.com>
;; Keywords: tools

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; 

;;; Code:

(require 'pcomplete)

(defcustom pcmpl-git-executable (or (executable-find "git") "git")
  "The full path of the 'git' executable."
  :type 'file
  :group 'pcomplete)

(defun pcmpl-git-commands ()
  "Return a collection of all 'git' commands."
  (let (beg end collection)
    (with-temp-buffer
      (call-process pcmpl-git-executable nil t nil "--help" "--all")
      (goto-char (point-min))
      (when (search-forward "----------------" nil t)
        (forward-line 1)
        (setq beg (point)))
      (goto-char (point-max))
      (forward-line -1)
      (when (re-search-backward "^$" nil t)
        (setq end (point)))
      (when (and beg end)
        (save-restriction
          (narrow-to-region beg end)
          (goto-char (point-min))
          (while (re-search-forward "\\s-\\(\\S-+\\)\\s-" nil t)
            (push (match-string 1) collection)))))
    (nreverse collection)))

;;;###autoload
(defun pcomplete/git ()
  "Completion rules for the `git' command."
  (pcomplete-here (pcmpl-git-commands)))

(provide 'pcmpl-git)
;;; pcmpl-git.el ends here
