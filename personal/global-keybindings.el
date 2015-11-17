;; If you want to be able to M-x without meta
(global-set-key (kbd "C-c C-m") 'smex)

;; use hippie-expand instead of dabbrev
(global-set-key (kbd "C-ç") 'hippie-expand)

(global-set-key (kbd "C-x ç") 'personal-comment-or-uncomment-region-or-line)

(global-set-key (kbd "M-2") 'personal-insert-at-sign)
(global-set-key (kbd "M-3") 'personal-insert-euro-sign)

(global-set-key (kbd "<escape>") 'god-local-mode)
(global-set-key (kbd "s-a") 'helm-projectile-ag)
(global-set-key (kbd "s-f") 'helm-projectile-find-file)

(global-set-key (kbd "s-l") 'goto-line)

(global-set-key (kbd "C-s") 'swiper-helm)
