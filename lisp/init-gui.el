;;; lisp/init-gui.el --- Emacs gui features.
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

;; disable tool bar
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode 0))

;; disable scroll bar
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode 0))

(setq use-file-dialog nil)
(setq use-dialog-box nil)
(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message t)
(setq initial-scratch-message ";;\n;; No more **** !!! \n;;\n\n")

;; use custom window size when emacs start up.
(when window-system
  (add-to-list 'default-frame-alist '(width . 120))
  (add-to-list 'default-frame-alist '(height . 30)))


(provide 'init-gui)
;;; init-gui.el ends here.
