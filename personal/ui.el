(prelude-require-packages '(auto-dim-other-buffers multiple-cursors smart-mode-line swiper swiper-helm))

;; disable scrollbar
(scroll-bar-mode -1)

;; set default font
(add-to-list 'default-frame-alist
             '(font . "Inconsolata-14"))

;; fallback font for unicode characters
(set-fontset-font "fontset-default" 'unicode "Menlo-13")

;; enable desktop-mode
(require 'desktop)

(setq desktop-save t)
(setq desktop-path (list prelude-savefile-dir))

(setq desktop-dirname prelude-savefile-dir)
(desktop-save-mode +1)

(auto-dim-other-buffers-mode)
(custom-set-faces
 '(auto-dim-other-buffers-face ((t (:background "#363636")))))

(sml/setup)
(sml/apply-theme 'automatic)

;; swiper
;; recenter after search
(defadvice swiper--action (after recenter activate)
  (recenter))
