(prelude-require-packages '(multiple-cursors))

(require 'server)
(unless (server-running-p)
  (server-start))
