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
  (load-theme 'material-spacegray t))
;; (el-get-bundle color-theme-sanityinc-tomorrow)

(provide 'init-theme)
;;; init-theme.el ends here.
