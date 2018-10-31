;;; init-elisp --- Emacs lisp mode settings.
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

(add-hook 'emacs-lisp-mode-hook
	  (lambda ()
	    (show-paren-mode -1)
	    (rainbow-delimiters-mode)))

(provide 'init-elisp)
;;; init-elisp.el ends here.
