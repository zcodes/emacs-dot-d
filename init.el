;;; init.el --- Entry file of Emacs configuration.
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

;; (package-initialize)

(setq gc-cons-threshold 104857600
      package-enable-at-startup nil)

(defun zcodes:init-load-paths ()
  "add custom path to `load-path'"
  (let ((paths '("~/.emacs.d/packages/el-get/"
		 "~/.emacs.d/lisp/"
		 "~/.emacs.d/site-lisp/")))
    (dolist (path paths)
      (add-to-list 'load-path path))))

(defun zcodes:init-custom-file ()
  "load custom configure file after emacs initialized."
  (setq custom-file "~/.emacs.d/custom.el")
  (add-hook 'after-init-hook
	    (lambda ()
	      (when (file-exists-p custom-file)
		(load custom-file)))))

(zcodes:init-load-paths)
(zcodes:init-custom-file)

;; common
(require 'init-el-get)
(require 'init-evil)
(require 'init-gui)
(require 'init-fonts)
(require 'init-theme)
(require 'init-org-mode)
(require 'init-basic)

;; languages
(require 'init-php)
(require 'init-elisp)

;;
;;
;;; init.el ends here.
