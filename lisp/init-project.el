;;; init-project.el --- Emacs project support
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

(el-get-bundle! projectile)

(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(setq projectile-enable-caching t)
(setq projectile-git-command "git ls-files -zco --exclude-standard")
;; (setq projectile-indexing-method 'hybrid)
(projectile-mode +1)

(provide 'init-project)
;;; init-project.el ends here.
