;;; lisp/init-fonts.el --- Emacs font.
;;
;; Copyright (c) 2017-2018 zcodes <zcodes@qq.com>
;;
;; Author: zcodes <zcodes@qq.com>
;; URL: https://github.com/zcodes/emacs-dot-d
;; License: MIT
;;
;; This file is NOT part of GNU Emacs.
;;
;;; Code:
;;
;; 字体设置
;;
;; Code New Roman 字体: https://sourceforge.net/projects/codenewroman/
;; 方正字体: http://www.foundertype.com/index.php/FontInfo/index/id/244.html
;;
;; 英文字体设置
;; :antialias 是Emacs MS-Windows下独有的配置
;; (set-frame-font "Code New Roman-14:antialias=standard")
;; or
;; (set-frame-font (font-spec :family "Code New Roman" :size 14.0 :antialias 'natural))
;;
;; 中文字体设置
;; (dolist (charset '(han cjk-misc))
;;   (set-fontset-font t charset
;;                      (font-spec
;;                       :family "方正悠黑简体 509R"
;;                       :size 15.0
;;                       :weight 'normal) nil 'prepend))
;;
;; Note: not change default font here.
;;       code here just for example.

(provide 'init-fonts)
;;; init-fonts.el ends here.
