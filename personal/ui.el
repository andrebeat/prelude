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

;; fullscreen
(defun personal-toggle-fullscreen ()
  (interactive)
  (cond
   ((eq system-type 'darwin)
    (set-frame-parameter
     nil 'fullscreen
     (when (not (frame-parameter nil 'fullscreen)) 'fullboth)))
   ((eq window-system 'x)
    (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
                           '(2 "_NET_WM_STATE_FULLSCREEN" 0)))
   (error "Unable to toggle fullscreen")))

(global-set-key (kbd "<f5>") 'personal-toggle-fullscreen)
