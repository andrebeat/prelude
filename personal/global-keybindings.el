;; If you want to be able to M-x without meta
(global-set-key (kbd "C-c C-m") 'smex)

;; use hippie-expand instead of dabbrev
(global-set-key (kbd "C-ç") 'hippie-expand)

(global-set-key (kbd "C-x ç") 'personal-comment-or-uncomment-region-or-line)

(global-set-key (kbd "M-2") 'personal-insert-at-sign)
(global-set-key (kbd "M-3") 'personal-insert-euro-sign)