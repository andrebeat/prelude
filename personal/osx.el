(when (eq system-type 'darwin)

  (prelude-swap-meta-and-super)

  (defun personal-toggle-fullscreen ()
    "Toggle full screen"
    (interactive)
    (set-frame-parameter
     nil 'fullscreen
     (when (not (frame-parameter nil 'fullscreen)) 'fullboth)))

  (global-set-key (kbd "<f5>") 'personal-toggle-fullscreen))
