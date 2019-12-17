;;; init.el --- Entry file of Emacs configuration.
;;
;; Copyright (c) 2017-2019 zcodes <zcodes@qq.com>
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

(setq gc-cons-threshold (* 512 1024 1024)
      gc-cons-percentage 0.5
      package-enable-at-startup nil)

;; setup custom-files
(setq custom-file "~/.emacs.d/custom.el")
(when (file-exists-p custom-file)
  (load custom-file))

;; setup load paths
(dolist (path '("~/.emacs.d/packages/el-get/"
                "~/.emacs.d/lisp/"
                "~/.emacs.d/site-lisp/"))
  (add-to-list 'load-path path))

;; common
(require 'init-el-get)
(require 'init-evil)
(require 'init-gui)
(require 'init-fonts)
(require 'init-theme)
(require 'init-org-mode)
(require 'init-basic)
(require 'init-project)
(require 'init-helm)
(require 'init-vcs)

;; languages
(require 'init-php)
(require 'init-elisp)
(require 'init-lisp)
(require 'init-nginx)

;;
;;
;;; init.el ends here.
