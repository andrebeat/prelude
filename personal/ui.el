(prelude-require-packages '(auto-dim-other-buffers multiple-cursors swiper swiper-helm))

;; disable scrollbar
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

;; set default font
(add-to-list 'default-frame-alist
             '(font . "Inconsolata-14"))

;; fallback font for unicode characters
(when (fboundp 'set-fontset-font)
  (set-fontset-font "fontset-default" 'unicode "Menlo-13"))

;; enable desktop-mode
(require 'desktop)

(setq desktop-save t)
(setq desktop-path (list prelude-savefile-dir))

(setq desktop-dirname prelude-savefile-dir)
(desktop-save-mode +1)

(auto-dim-other-buffers-mode)
(custom-set-faces
 '(auto-dim-other-buffers-face ((t (:background "#363636")))))

(add-to-list 'sml/replacer-regexp-list '("^~/Workbench/" ":WB:") t)
(add-to-list 'sml/replacer-regexp-list `(,(concat "^" (file-truename "~/org/")) ":Org:") t)
(add-to-list 'sml/replacer-regexp-list `(,(concat "^" (file-truename "~/Dropbox/")) ":DB:") t)
(add-to-list 'sml/replacer-regexp-list '("^~/.homesick/repos/dotfiles/home/.emacs.d/" ":ED:") t)

(setq rm-blacklist
      '(" ,"
        " Abbrev"
        " company"
        " Dim"
        " Fly"
        " guru"
        " Helm"
        " Ind"
        " Pre"
        " SP"
        " ws"
        " yas"))

;; swiper
;; recenter after search
(defadvice swiper--action (after recenter activate)
  (recenter))
