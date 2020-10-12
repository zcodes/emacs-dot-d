;;; lisp/init-theme.el --- Emacs color theme.
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

(el-get-bundle emacs-material-theme)

;; other awesome themes
(el-get-bundle doom-themes)
(require 'doom-themes)
(setq doom-themes-enable-bold nil
      doom-themes-enable-italic nil)
(doom-themes-org-config)
;; (el-get-bundle emacs-ample-theme
;;   :url "https://github.com/jordonbiondo/ample-theme.git"
;;   (add-to-list 'custom-theme-load-path "~/.emacs.d/packages/emacs-ample-theme/"))

(provide 'init-theme)
;;; init-theme.el ends here.
