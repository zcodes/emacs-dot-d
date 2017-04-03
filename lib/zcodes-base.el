;;; lib/zcodes-base.el --- base common used functions.
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


(defun zcodes:time-string ()
  "insert current time with format `%Y-%m-%d %H:%M:%S'"
  (interactive)
  (insert (format-time-string "%Y-%m-%d %H:%M:%S")))


(provide 'zcodes-base)
;;; zcodes-base.el ends here.
