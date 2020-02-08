;;; init-core.el --- core configurations.
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

;; borrowed from doom.
(defconst EMACS27+ (> emacs-major-version 26))
(defconst IS-MAC (eq system-type 'darwin))
(defconst IS-LINUX (eq system-type 'gnu/linux))
(defconst IS-WINDOWS (memq system-type '(cygwin windows-nt ms-dos)))
(defconst IS-BSD (or IS-MAC (eq system-type 'berkeley-unix)))


(provide 'init-core)
;;
;;; init-core.el ends here.
