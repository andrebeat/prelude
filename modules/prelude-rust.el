(require 'prelude-programming)
(prelude-require-packages '(rust-mode))

(setq racer-rust-src-path "/Users/beat/Workbench/rust/src")
(setq racer-cmd "/Users/beat/Workbench/racer/target/release/racer")
(add-to-list 'load-path "/Users/beat/Workbench/racer/editors")
(eval-after-load "rust-mode" '(require 'racer))

(provide 'prelude-rust)

;;; prelude-rust.el ends here
