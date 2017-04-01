;;; lisp/init-theme.el --- Emacs color theme.
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


(el-get-bundle emacs-material-theme
  :type github
  :pkgname "zcodes/emacs-material-theme"
  (add-to-list 'custom-theme-load-path default-directory)
  (load-theme 'material t))

(provide 'init-theme)

;;; init-theme.el ends here.
