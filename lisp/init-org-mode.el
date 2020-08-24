;;; lisp/init-org-mode.el --- Emacs org-mode.
;;
;; Copyright (c) 2017-2020 zcodes <zcodes@qq.com>
;;
;; Author: zcodes <zcodes@qq.com>
;; URL: https://github.com/zcodes/emacs-dot-d
;; License: MIT
;;
;; This file is NOT part of GNU Emacs.
;;
;;; Code:

(el-get-bundle org-mode)
(el-get-bundle htmlize)

;; disable org-bullets, it's hard to display unicode characters in
;; common fonts.
;; (el-get-bundle org-bullets
;;   (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(setq org-log-done t
      org-hide-emphasis-markers nil
      org-catch-invisible-edits 'show
      org-export-coding-system 'utf-8
      org-html-validation-link nil
      org-tags-column 80
      org-html-doctype "html5")


(defun zcodes:org-file-path (file)
  "concat FILE with `org-directory'"
  (if (boundp 'org-directory)
      (concat org-directory file)
    (concat (expand-file-name "~") file)))

(with-eval-after-load "custom.el"
  (setq org-default-notes-file (zcodes:org-file-path "/notes.org")
        org-capture-templates `(("t" "todo" entry (file ,(zcodes:org-file-path "todo.org"))
                                 "* TODO %?\n%U\n" :clock-resume t)
                                ("n" "note" entry (file "") "* %? :NOTE:\n%U\n" :clock-resume t)
                                ("j" "journal" entry (file+olp+datetree ,(zcodes:org-file-path "/journal.org"))
                                 "* %?\nEntered on %<[%H:%M:%S]>\n %i\n" :clock-resume t))))

(setq org-todo-keywords
      '((sequence "TODO(t)" "|" "DONE(d)" "CANCELED(c)")))

(defun my-html-filter-add-notes-class (text backend info)
  "Add .org-note class to exported log note."
  (when (org-export-derived-backend-p backend 'html)
    (replace-regexp-in-string
     "\<li\>\\(\<p\>\n\\)?\\(Note taken on.*\</span\>\</span\>\\) \<br\>\\(.*\\)"
     "\<li class=\"org-note\"\>\\1\<span class=\"org-note-label\"\>\\2\</span\>" text)))
(add-hook 'org-mode-hook
          (lambda ()
            ;; <s to expand org structure template
            (require 'org-tempo)
            ;; disable electric pair mode for org-mode
            (electric-pair-local-mode -1)
            ;; bind key <f12> to publish current org file
            (local-set-key (kbd "<f12>") 'org-publish-current-file)
            ;; override default publish functions.
            (add-to-list 'org-export-filter-plain-list-functions 'my-html-filter-add-notes-class)))
            
(provide 'init-org-mode)
;;; init-org-mode.el ends here.
