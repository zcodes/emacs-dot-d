;;; init-keys --- all the customized key bindings
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

(dolist (mode '(emacs-lisp-mode lisp-interaction-mode))
  (evil-leader/set-key-for-mode mode
    "e e" 'eval-last-sexp
    "e b" 'eval-buffer
    ;; like ctrl-] without need tag files
    "g" 'xref-find-definitions))

(evil-leader/set-key
  "f" 'helm-find-files
  "p" 'helm-browse-project
  "s" 'server-edit
  "b b" 'helm-buffers-list
  "b f" 'ibuffer
  "b d" 'dired
  "h x" 'helm-M-x
  "h b" 'helm-filtered-bookmarks
  "h m" 'helm-mini
  "h y" 'helm-show-kill-ring
  "h f" 'helm-find-files
  "h p" 'helm-browse-project)

;; evil customed key maps
(define-key evil-normal-state-map (kbd "SPC") 'evil-ex)
(define-key evil-normal-state-map (kbd "C-z") 'suspend-frame)
(define-key evil-insert-state-map (kbd "C-z") 'suspend-frame)

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-b") 'ibuffer)

(global-set-key (kbd "<f3>") 'sr-speedbar-focus)
(global-set-key (kbd "<f4>") 'sr-speedbar-close)
;; (global-set-key (kbd "<f8>") 'neotree-toggle)

;; keys for ibuffer
(with-eval-after-load 'ibuffer
  (define-key ibuffer-mode-map (kbd "j") 'ibuffer-forward-line)
  (define-key ibuffer-mode-map (kbd "k") 'ibuffer-backward-line)
  (define-key ibuffer-mode-map (kbd "C-j") 'ibuffer-jump-to-buffer))

;; keys for neotree
;; (evil-define-key 'normal neotree-mode-map (kbd "RET")
;;     (neotree-make-executor :file-fn 'neo-open-file :dir-fn 'neo-open-dir))
;; (evil-define-key 'normal neotree-mode-map "u" 'neotree-select-up-node)
;; (evil-define-key 'normal neotree-mode-map "i" 'neotree-hidden-file-toggle)
;; (evil-define-key 'normal neotree-mode-map "c" 'neotree-change-root)
;; (evil-define-key 'normal neotree-mode-map "r" 'neotree-refresh)

;; keys for org-mode
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

(provide 'init-keys)
;;; init-keys.el ends here.
