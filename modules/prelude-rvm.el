(prelude-require-packages '(rvm))

(require 'rvm)
(rvm-use-default) ;; use rvm's default ruby for the current Emacs session

(provide 'prelude-rvm)
