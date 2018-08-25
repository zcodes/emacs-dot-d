;;; lisp/init-org-mode.el --- Emacs org-mode.
;;
;; Copyright (c) 2017 zcodes <zcodes@qq.com>
;;
;; Author: zcodes <zcodes@qq.com>
;; URL: https://github.com/zcodes/emacs-dot-d
;; License: MIT
;;
;; This file is NOT part of GNU Emacs.
;;
;;; Code:


(el-get-bundle 'org-mode)
; (el-get-bundle 'org-bullets
;   (setq org-bullets-bullet-list
;   	'("※" "○" "⬡" "⬠" "□" "▷" "⊛" "⊕" "⊖"))
;   (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(setq org-log-done t
      org-hide-emphasis-markers t
      org-catch-invisible-edits 'show
      org-export-coding-system 'utf-8
      org-html-validation-link nil
      org-tags-column 80
      org-html-doctype "html5")

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

(defun zcodes:org-file-path (file)
  "concat FILE with `org-directory'"
  (if (boundp 'org-directory)
      (concat org-directory file)
    (concat (expand-file-name "~") file)))

(with-eval-after-load "custom.el"
  (progn
    (setq org-default-notes-file
	  (zcodes:org-file-path "/notes.org"))
    (setq org-capture-templates
	  `(("t" "todo" entry (file ,(zcodes:org-file-path "/todo.org"))
	     "* TODO %?\n%U\n" :clock-resume t)
	    ("w" "work" entry (file ,(zcodes:org-file-path "/work.org"))
	     "* TODO %?\n%U\n" :clock-resume t)
	    ("n" "note" entry (file "")
	     "* %? :NOTE:\n%U\n" :clock-resume t)
	    ("j" "journal" entry (file+datetree ,(zcodes:org-file-path "/journal.org"))
	     "* %?\nEntered on %<[%H:%M:%S]>\n %i\n" :clock-resume t)))))
(setq org-todo-keywords
      '((sequence "TODO(t)" "|" "DONE(d)" "CANCELED(c)")))

(provide 'init-org-mode)

;;; init-org-mode.el ends here.
