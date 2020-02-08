;;; init-evil.el --- Evil plugin configure
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

(el-get-bundle evil)
(el-get-bundle evil-leader)
(el-get-bundle evil-org-mode)
(el-get-bundle github:emacs-evil/evil-collection)

;; evil customed key maps
(define-key evil-normal-state-map (kbd "SPC") 'evil-ex)
(define-key evil-normal-state-map (kbd "C-z") 'suspend-frame)
(define-key evil-insert-state-map (kbd "C-z") 'suspend-frame)

(evil-mode 1)
(global-evil-leader-mode)

(evil-leader/set-key
  "b b" 'ido-switch-buffer
  "b f" 'ibuffer
  "b d" 'dired
  "f" 'ido-find-file
  "p" 'projectile-command-map)

(dolist (mode '(emacs-lisp-mode lisp-interaction-mode))
  (evil-leader/set-key-for-mode mode
    "e e" 'eval-last-sexp
    "e b" 'eval-buffer
    "g" 'xref-find-definitions))

(provide 'init-evil)
;;; init-evil.el ends here.
