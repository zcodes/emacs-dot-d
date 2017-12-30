;;; lisp/init-basic.el --- Emacs basic settings and common used plugins.
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

;; disable this sucking feature first
(setq blink-matching-paren nil)

;; prefer utf-8 encoding and unix line ending.
(prefer-coding-system 'utf-8-unix)

;; line numbers.
(el-get-bundle 'nlinum
  (global-nlinum-mode t))
(setq nlinum-format "%d ")

;; highlight current line.
(when window-system
  (global-hl-line-mode t))

;; parenthesis
(show-paren-mode -1)
(electric-pair-mode 1)

;; no blink cursor.
(blink-cursor-mode 0)

(setq show-paren-style "parenthesis"
      indent-tabs-mode 0
      mouse-wheel-scroll-amount '(2 ((shift) . 2))
      mouse-wheel-progressive-speed nil
      mouse-wheel-follow-mouse 1
      minibuffer-prompt-properties '(readonly t point-entered minibuffer-avoid-prompt face minibuffer-prompt)
      make-backup-files nil
      vc-make-backup-files nil)

(defalias 'yes-or-no-p 'y-or-n-p)

;; enable some disabled features.
(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)
(put 'narrow-to-defun 'disabled nil)
(put 'set-goal-column 'disabled nil)
(put 'erase-buffer 'disabled nil)

;; keyword for TODO FIXME BUG NOTES
(add-hook 'prog-mode-hook
	  (lambda ()
	    (font-lock-add-keywords
	     nil
	     '(("\\<\\(FIXME\\|TODO\\|BUG\\|NOTES\\):?" 1 font-lock-warning-face t)))))

;; NOTES the spell for `separtor' is should be `separator', error in
;; `pangu-spacing.el'
(el-get-bundle 'pangu-spacing
  (global-pangu-spacing-mode 1)
  (dolist (mode '(org-mode-hook markdown-mode-hook))
    (add-hook mode
	      '(lambda ()
		 (set (make-local-variable
		       'pangu-spacing-real-insert-separtor) t)))))

;; ido and flx (fuzzy matching).
(el-get-bundle 'flx
  (require 'flx-ido)
  (setq ido-enable-flex-matching 1
	ido-use-faces nil)
  (ido-mode 1)
  (ido-everywhere 1)
  (flx-ido-mode 1)
  (define-key ido-common-completion-map (kbd "<escape>") 'abort-recursive-edit)
  (define-key minibuffer-local-map (kbd "<escape>") 'abort-recursive-edit))

;; powerline.
(el-get-bundle 'powerline
  (setq powerline-default-separator 'box)
  (powerline-default-theme))

;; ibuffer.
(el-get-bundle 'ibuffer-vc)
(with-eval-after-load 'ibuffer
  (define-ibuffer-column size-h
    (:name "Size" :inline t)
    (cond
     ((> (buffer-size) 1000000) (format "%7.1fM" (/ (buffer-size) 1000000.0)))
     ((> (buffer-size) 1000) (format "%7.1fK" (/ (buffer-size) 1000.0)))
     (t (format "%8d" (buffer-size))))))

(with-eval-after-load 'ibuffer
  (define-key ibuffer-mode-map (kbd "j") 'ibuffer-forward-line)
  (define-key ibuffer-mode-map (kbd "k") 'ibuffer-backward-line)
  (define-key ibuffer-mode-map (kbd "C-j") 'ibuffer-jump-to-buffer))

(with-eval-after-load 'ibuffer
  (require 'ibuffer-vc))

(global-set-key (kbd "C-x C-b") 'ibuffer)

(defun zcodes:ibuffer-set-up-preferred-filters ()
  (ibuffer-vc-set-filter-groups-by-vc-root)
  (unless (eq ibuffer-sorting-mode 'filename/process)
    (ibuffer-do-sort-by-filename/process)))
(add-hook 'ibuffer-hook 'zcodes:ibuffer-set-up-preferred-filters)

(setq ibuffer-formats
      '((mark modified read-only vc-status-mini " "
	      (name 28 28 :left :elide)
	      " "
	      (size-h 9 -1 :left :elide)
	      " "
	      filename-and-process)
	(mark modified read-only vc-status-mini " "
	      (name 28 28 :left :elide)
	      " "
	      (size-h 9 -1 :right)
	      " "
	      (mode 16 16 :left :elide)
	      " "
	      (vc-status 16 16 :left)
	      " "
	      filename-and-process)))
(setq ibuffer-filter-group-name-face 'font-lock-doc-face)

;; dired
;; TODO https://github.com/emacsmirror/dired-sort
;; TODO https://github.com/Fuco1/dired-hacks
(el-get-bundle 'dired+
  (setq-default diredp-hide-details-initially-flag nil
		dired-dwin-target t)
  (with-eval-after-load 'dired
    (require 'dired+)
    (when (fboundp 'global-dired-hide-details-mode)
      (global-dired-hide-details-mode 0))
    (setq dired-recursive-deletes 'top)))

;; speedbar
(el-get-bundle 'sr-speedbar)
(setq sr-speedbar-skip-other-window-p t
      sr-speedbar-right-side nil
      sr-speedbar-auto-refresh nil
      speedbar-use-images nil
      speedbar-show-unknown-files t
      speedbar-update-flags nil)

(global-set-key (kbd "<f3>") 'sr-speedbar-open)
(global-set-key (kbd "<f4>") 'sr-speedbar-close)

;; company-mode
(el-get-bundle 'company-mode)
(add-hook 'after-init-hook 'global-company-mode)

;; company-flx
(el-get-bundle 'company-flx)
(with-eval-after-load 'company
  (company-flx-mode +1))

;; yasnippet
(el-get-bundle 'yasnippet
  (yas-global-mode +1))

;; window numbering
(el-get-bundle 'window-numbering
  (window-numbering-mode +1))

;; helpful colors
(el-get-bundle 'rainbow-mode
  (rainbow-mode))
(el-get-bundle 'rainbow-delimiters)

(provide 'init-basic)
;;; init-basic.el ends here.
