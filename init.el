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

;; do not remove this
;; (package-initialize)

(setq gc-cons-threshold 104857600
      package-enable-at-startup nil)

;; setup custom-files
(setq custom-file "~/.emacs.d/custom.el")
(setq custom-file-before "~/.emacs.d/custom.before.el")
(when (file-exists-p custom-file-before)
  (load custom-file-before))
(add-hook 'after-init-hook
          (lambda ()
            (when (file-exists-p custom-file)
              (load custom-file))))

;; setup load paths
(let ((paths '("~/.emacs.d/packages/el-get/"
	       "~/.emacs.d/lisp/"
	       "~/.emacs.d/site-lisp/")))
  (dolist (path paths)
    (add-to-list 'load-path path)))

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
(require 'init-lisp)
(require 'init-nginx)

;;
;;
;;; init.el ends here.
