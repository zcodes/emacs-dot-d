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
  (load-theme 'material t))

(el-get-bundle emacs-doom-themes
  :url "https://github.com/hlissner/emacs-doom-themes.git"
  (require 'doom-themes)
  ;; (setq doom-themes-enable-bold nil
  ;;       doom-themes-enable-italic nil)

  ;; (load-theme 'doom-tomorrow-night t)
  ;; (doom-themes-neotree-config)
  ;; (doom-themes-org-config)
  )

(el-get-bundle emacs-ample-theme
  :url "https://github.com/jordonbiondo/ample-theme.git"
  (add-to-list 'custom-theme-load-path "~/.emacs.d/packages/emacs-ample-theme/")
  )

;;(el-get-bundle color-theme-sanityinc-tomorrow)

(provide 'init-theme)
;;; init-theme.el ends here.
