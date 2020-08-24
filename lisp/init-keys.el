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
    "g" 'xref-find-definitions))

(evil-leader/set-key
  "f" 'helm-find-files
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

(global-set-key (kbd "<f3>") 'sr-speedbar-open)
(global-set-key (kbd "<f4>") 'sr-speedbar-close)
(global-set-key (kbd "<f8>") 'neotree-toggle)

;; keys for ibuffer
(with-eval-after-load 'ibuffer
  (define-key ibuffer-mode-map (kbd "j") 'ibuffer-forward-line)
  (define-key ibuffer-mode-map (kbd "k") 'ibuffer-backward-line)
  (define-key ibuffer-mode-map (kbd "C-j") 'ibuffer-jump-to-buffer))

;; keys for neotree
(evil-define-key 'normal neotree-mode-map (kbd "RET")
    (neotree-make-executor :file-fn 'neo-open-file :dir-fn 'neo-open-dir))
(evil-define-key 'normal neotree-mode-map "u" 'neotree-select-up-node)
(evil-define-key 'normal neotree-mode-map "i" 'neotree-hidden-file-toggle)
(evil-define-key 'normal neotree-mode-map "c" 'neotree-change-root)
(evil-define-key 'normal neotree-mode-map "r" 'neotree-refresh)

;; keys for winum
(setq winum-keymap
      (let ((map (make-sparse-keymap)))
        (define-key map (kbd "C-`") 'winum-select-window-by-number)
        (define-key map (kbd "M-0") 'winum-select-window-0-or-10)
        (define-key map (kbd "M-1") 'winum-select-window-1)
        (define-key map (kbd "M-2") 'winum-select-window-2)
        (define-key map (kbd "M-3") 'winum-select-window-3)
        (define-key map (kbd "M-4") 'winum-select-window-4)
        (define-key map (kbd "M-5") 'winum-select-window-5)
        (define-key map (kbd "M-6") 'winum-select-window-6)
        (define-key map (kbd "M-7") 'winum-select-window-7)
        (define-key map (kbd "M-8") 'winum-select-window-8)
        (define-key map (kbd "M-9") 'winum-select-window-9)
        map))

;; keys for org-mode
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

(provide 'init-keys)
;;; init-keys.el ends here.
