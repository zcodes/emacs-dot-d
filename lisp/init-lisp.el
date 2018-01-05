;;; init-lisp.el --- common lisp stuffs
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

(el-get-bundle dash)
(el-get-bundle slime.git
  :url "https://github.com/slime/slime.git"
  (require 'slime-autoloads))

(if (boundp 'zcodes-inferior-lisp-program)
    (setq inferior-lisp-program zcodes-inferior-lisp-program))

(add-to-list 'slime-contribs 'slime-fancy)
(add-to-list 'slime-contribs 'slime-indentation)
(add-to-list 'slime-contribs 'slime-sbcl-exts)
(add-to-list 'slime-contribs 'slime-scratch)

(el-get-bundle parinfer-mode
  :url "https://github.com/DogLooksGood/parinfer-mode.git"
  (eval-when-compile (require 'parinfer))
  (add-hook 'parinfer-mode-hook
            (lambda ()
              (setq parinfer-extensions
                    '(defaults
                       pretty-parens
                       smart-yank
                       ;; smart-tab
                       paredit
                       ;; lispy
                       evil))))
  (add-hook 'emacs-lisp-mode-hook #'parinfer-mode)
  (add-hook 'lisp-mode-hook #'parinfer-mode))

;; (setq slime-lisp-implementations
;;      '((sbcl ("sbcl" "--core" "sbcl.core-for-slime"))))

;; (if (fboundp 'electric-pair-local-mode)
;;     (defalias 'zcodes:electric-pair-local-mode 'electric-pair-local-mode)
;;   (defalias 'zcodes:electric-pair-local-mode 'electric-pair-mode))

;; (defun zcodes:enable-electric-pair-mode-locally ()
;;   (zcodes:electric-pair-local-mode 1))

;; (dolist (hook '(emacs-lisp-mode-hook lisp-mode-hook))
;;   (add-hook hook 'zcodes:enable-electric-pair-mode-locally))

;; (add-hook 'slime-repl-mode-hook
;; 	  (lambda ()
;; 	    (zcodes:electric-pair-local-mode 0)))

(add-hook 'lisp-mode-hook
          (lambda ()
            (set (make-local-variable 'lisp-indent-function)
                 'common-lisp-indent-function)
            (put 'defsystem 'common-lisp-indent-function 0)
            (put 'define-package 'common-lisp-indent-function '(2 2))
            (put 'prog1 'common-lisp-indent-function 0)))


(provide 'init-lisp)
;;; init-lisp.el ends here.
