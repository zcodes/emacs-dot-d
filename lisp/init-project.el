;;; init-project.el --- Emacs project support
;;
;; Copyright (c) 2017-2019 zcodes <zcodes@qq.com>
;;
;; Author: zcodes <zcodes@qq.com>
;; URL: https://github.com/zcodes/emacs-dot-d
;; License: MIT
;;
;; This file is NOT part of GNU Emacs.
;;
;;; Code:

(el-get-bundle! 'projectile)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(projectile-mode +1)
(setq projectile-enable-caching t)
(setq projectile-git-command "git ls-files -zco --exclude-standard")
;; (setq projectile-indexing-method 'hybrid)

(provide 'init-project)
;;; init-project.el ends here.
