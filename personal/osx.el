(when (eq system-type 'darwin)
  (if (version< emacs-version "24.4")
      (progn
        (defun personal-toggle-fullscreen ()
          "Toggle full screen"
          (interactive)
          (set-frame-parameter
           nil 'fullscreen
           (when (not (frame-parameter nil 'fullscreen)) 'fullboth)))
        (global-set-key (kbd "<f5>") 'personal-toggle-fullscreen))
    (progn
      (setq ns-use-native-fullscreen nil)
      (global-set-key (kbd "<f5>") 'toggle-frame-fullscreen))))
