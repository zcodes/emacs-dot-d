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
  "设置Emacs的字体"
  (interactive)
  (when window-system
    (set-frame-font "Consolas 13")
    (dolist (charset '(latin han symbol cjk-misc unicode))
      (set-fontset-font t charset (font-spec
				   :family "Inziu Iosevka SC"
				   :weight 'normal
				   :style 'normal
				   :size 13.0)))))

(defun zcodes:set-org-table-font ()
  "针对org表格中文导致无法对齐表格，单独设置中文字体"
  (when window-system
    (set-face-attribute 'org-table nil
			:font "Inziu Iosevka SC 12")))

(zcodes:set-gui-font)
(add-hook 'org-mode-hook 'zcodes:set-org-table-font)


(provide 'init-fonts)
;;; init-fonts.el ends here.
