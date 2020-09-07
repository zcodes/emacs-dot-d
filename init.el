;;; init.el --- Entry file of Emacs configuration.
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

;; do not remove this
;; (package-initialize)

(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.6
      package-enable-at-startup nil)

(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold (* 16 1024 1024)
                  gc-cons-percentage 0.1)))

(setq user-emacs-directory (file-name-directory load-file-name))

(defvar zcodes-enable-benchmark nil
  "Enable benchmark at start.")

;; setup custom-files
(setq custom-file (concat user-emacs-directory "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file nil 'nomessage))

;; setup load paths
(dolist (path '("packages/el-get/"
                "lisp/"
                "site-lisp/"))
  (add-to-list 'load-path (concat user-emacs-directory path)))

(if zcodes-enable-benchmark
    (progn
      (require 'benchmark-init)
      (require 'benchmark-init-modes)
      (benchmark-init/activate)))

;; common
(require 'init-core)
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
(require 'init-cmake)

;; at last, load customized keys
(require 'init-keys)

;; start emacs server
(require 'server)
(unless (server-running-p)
  (server-start))
;;
;;
;;; init.el ends here.
