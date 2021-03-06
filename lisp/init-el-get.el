;;; lisp/init-el-get.el --- El-get plugin.
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

;; custom el-get paths
(setq el-get-dir (expand-file-name "~/.emacs.d/packages/")
      el-get-install-dir (expand-file-name "~/.emacs.d/packages/el-get/")
      el-get-git-install-url "https://github.com/zcodes/el-get.git"
      el-get-emacswiki-base-url "https://www.emacswiki.org/emacs/download/"
      el-get-install-shallow-clone t
      el-get-git-shallow-clone t
      el-get-bundle-byte-compile t
      el-get-is-lazy t
      el-get-verbose nil 
      el-get-bundle-sync t
      el-get-auto-update-cached-recipes nil)

(setq package-archives '(("gnu"   . "https://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))

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
            (el-get 'sync)
            (package-initialize)))

(provide 'init-el-get)
;;; init-el-get.el ends here.
