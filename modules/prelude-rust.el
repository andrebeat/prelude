(require 'prelude-programming)
(prelude-require-packages '(rust-mode toml-mode racer))

(setq racer-rust-src-path "/Users/beat/Workbench/rust/src")
(setq racer-cmd "/Users/beat/Workbench/racer/target/release/racer")

(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'racer-mode-hook #'company-mode)

(global-set-key (kbd "TAB") #'company-indent-or-complete-common)
(setq company-tooltip-align-annotations t)

(provide 'prelude-rust)

;;; prelude-rust.el ends here
