(require 'server)
(unless (server-running-p)
  (server-start))

(setq magit-last-seen-setup-instructions "1.4.0")
