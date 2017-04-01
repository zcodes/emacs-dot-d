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
(el-get-bundle 'org-bullets
  (setq org-bullets-bullet-list
  	'("※" "○" "⬡" "⬠" "□" "▷" "⊛" "⊕" "⊖"))
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(setq org-log-done t
      org-hide-emphasis-markers t
      org-catch-invisible-edits 'show
      org-export-coding-system 'utf-8
      org-html-validation-link nil
      org-tags-column 80
      org-html-doctype "html5")

(provide 'init-org-mode)

;;; init-org-mode.el ends here.
