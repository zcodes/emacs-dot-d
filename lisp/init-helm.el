;;; init-helm.el --- configuration for Emacs helm package
;;
;; Copyright (c) 2017-2018 zcodes <zcodes@qq.com>
;;
;; Author: zcodes <zcodes@qq.com>
;; URL: https://github.com/zcodes/emacs-dot-d
;; License: MIT
;;
;; This file is NOT part of GNU Emacs.
;;
;;; commentary
;; https://github.com/emacs-helm/helm
;; http://tuhdo.github.io/helm-intro.html
;;
;;; Code:


(el-get-bundle popup)
(el-get-bundle emacs-async)
(el-get-bundle! helm)
(el-get-bundle! helm-ls-git)

(require 'helm-config)

(if (fboundp 'evil-leader/set-key)
    (evil-leader/set-key
      "h x" 'helm-M-x
      "h b" 'helm-filtered-bookmarks
      "h m" 'helm-mini
      "h y" 'helm-show-kill-ring
      "h f" 'helm-find-files
      "h p" 'helm-browse-project))
(helm-mode 1)

(provide 'init-helm)
;;; init-helm.el ends here.
