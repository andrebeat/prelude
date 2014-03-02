(defun personal-comment-or-uncomment-region-or-line ()
  "Comments or uncomments the region or the current line if there's no active region."
  (interactive)
  (let (beg end)
    (if (region-active-p)
        (setq beg (region-beginning) end (region-end))
      (setq beg (line-beginning-position) end (line-end-position)))
    (comment-or-uncomment-region beg end)))

(defun personal-insert-at-sign ()
  "Inserts an at sign into the buffer."
  (interactive)
  (insert "@"))

(defun personal-insert-euro-sign ()
  "Inserts an euro sign into the buffer."
  (interactive)
  (insert "€"))
