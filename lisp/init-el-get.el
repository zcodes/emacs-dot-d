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

(setq package-archives
      '(("gnu" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
        ("melpa" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(setq el-get-git-install-url "https://github.com/zcodes/el-get.git")
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/zcodes/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(setq el-get-user-package-directory "~/.emacs.d/packages.d")

(when (string-equal system-type "windows-nt")
  (setq package-check-signature nil))

(add-hook 'after-init-hook
          (lambda ()
            (el-get 'sync)))

(provide 'init-el-get)

;;; init-el-get.el ends here.
