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

(el-get-bundle slime.git
  :url "https://github.com/slime/slime.git"
  (require 'slime-autoloads))

(if (boundp 'zcodes-inferior-lisp-program)
    (setq inferior-lisp-program zcodes-inferior-lisp-program))

(add-to-list 'slime-contribs 'slime-fancy)

;; (setq slime-lisp-implementations
;;      '((sbcl ("sbcl" "--core" "sbcl.core-for-slime"))))

(defun zcodes:enable-electric-pair-mode-locally ()
  (electric-pair-mode 1))

(dolist (hook '(emacs-lisp-mode-hook lisp-mode-hook))
  (zcodes:enable-electric-pair-mode-locally))

(provide 'init-lisp)
;;; init-lisp.el ends here.
