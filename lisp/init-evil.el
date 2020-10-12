;;; init-evil.el --- Evil plugin configure
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

(el-get-bundle evil)
(el-get-bundle evil-leader)
(el-get-bundle evil-org-mode)
(el-get-bundle github:emacs-evil/evil-collection)

(setq evil-want-C-i-jump nil)
(evil-mode 1)
(global-evil-leader-mode)

(provide 'init-evil)
;;; init-evil.el ends here.
