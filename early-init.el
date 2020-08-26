(setq package-enable-at-startup nil)
(setq frame-inhibit-implied-resize t)
(setq inhibit-compacting-font-caches t)

(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)


(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.8)
