;;; lisp/init-fonts.el --- Emacs font.
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

(defun zcodes:set-gui-font ()
  (set-frame-font "Inziu Iosevka SC Bold Italic 12")
  (dolist (charset '(latin han symbol cjk-misc unicode))
    (set-fontset-font t charset (font-spec
				 :family "Inziu Iosevka SC"
				 :weight 'bold
				 :style 'normal
				 :size 12.0))))
(if window-system 
  (zcodes:set-gui-font)
  )

(provide 'init-fonts)

;;; init-fonts.el ends here.
