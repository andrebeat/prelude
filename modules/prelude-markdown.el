(prelude-require-packages '(markdown-mode))

(custom-set-variables
 '(markdown-command "redcarpet --parse tables")
 '(markdown-command-needs-filename t))

(provide 'prelude-markdown)
