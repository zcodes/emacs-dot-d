;;; lisp/init-el-get.el --- El-get plugin.
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

;; custom el-get paths
(setq el-get-dir "~/.emacs.d/packages/"
      el-get-install-dir "~/.emacs.d/packages/el-get/"
      el-get-git-install-url "https://github.com/zcodes/el-get.git")

(add-to-list 'load-path el-get-install-dir)
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/zcodes/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

;; custom el-get recipes
(add-to-list 'el-get-recipe-path "~/.emacs.d/recipes/")

;; sync el-get
(add-hook 'after-init-hook
          (lambda ()
            (el-get 'sync)))

(provide 'init-el-get)
;;; init-el-get.el ends here.
