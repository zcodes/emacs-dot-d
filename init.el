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

(setq gc-cons-threshold 104857600
      package-enable-at-startup nil)

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)			

(defun zcodes:init-load-paths ()
  (let ((paths '("~/.emacs.d/el-get/el-get"
		 "~/.emacs.d/lisp")))
    (dolist (path paths)
      (add-to-list 'load-path path))))

(defun zcodes:init-custom-file ()
  (setq custom-file "~/.emacs.d/custom.el")
  (add-hook 'after-init-hook
	    (lambda ()
	      (when (file-exists-p custom-file)
		(load custom-file)))))

(zcodes:init-load-paths)
(zcodes:init-custom-file)

(require 'init-el-get)
(require 'init-gui)
(require 'init-fonts)
(require 'init-theme)
(require 'init-org-mode)
(require 'init-basic)

;;; init.el ends here.
