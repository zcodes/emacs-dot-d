;;; init-evil.el --- Evil plugin configure
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

(el-get-bundle 'undo-tree)
(el-get-bundle 'evil)
(el-get-bundle 'evil-leader)

;; evil customed key maps
(define-key evil-normal-state-map (kbd "SPC") 'evil-ex)
(define-key evil-normal-state-map (kbd "C-z") 'suspend-frame)
(define-key evil-insert-state-map (kbd "C-z") 'suspend-frame)

(evil-mode 1)
(global-evil-leader-mode)

(evil-leader/set-key
  "b e" 'ibuffer
  "b f" 'ido-switch-buffer
  "b d" 'dird
  "f" 'ido-find-file)

(dolist (mode '(emacs-lisp-mode lisp-interaction-mode))
  (evil-leader/set-key-for-mode mode
    "e e" 'eval-last-sexp
    "e b" 'eval-buffer))

(setq evil-highlight-closing-paren-at-point-states nil)

(provide 'init-evil)
;;; init-evil.el ends here.
