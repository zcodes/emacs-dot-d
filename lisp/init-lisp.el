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
  (require 'slime-autoloads)

  ;; set this in custom.el
  ;; (setq inferior-lisp-program "path-to-lisp")

  ;; enable slime contribs
  (dolist (contrib '(slime-fancy
                     slime-indentation
                     slime-sbcl-exts
                     inferior-slime
                     slime-scratch))
    (add-to-list 'slime-contribs contrib)))

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

(add-hook 'lisp-mode-hook
          (lambda ()
            (set (make-local-variable 'lisp-indent-function)
                 'common-lisp-indent-function)
            (put 'defsystem 'common-lisp-indent-function 0)
            (put 'define-package 'common-lisp-indent-function '(2 2))
            (put 'prog1 'common-lisp-indent-function 0)))


(provide 'init-lisp)
;;; init-lisp.el ends here.
