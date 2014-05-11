;;; prelude-org.el --- Emacs Prelude: org-mode configuration.
;;
;; Copyright © 2011-2013 Bozhidar Batsov
;;
;; Author: Bozhidar Batsov <bozhidar@batsov.com>
;; URL: https://github.com/bbatsov/prelude
;; Version: 1.0.0
;; Keywords: convenience

;; This file is not part of GNU Emacs.

;;; Commentary:

;; Some basic configuration for org-mode.

;;; License:

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 3
;; of the License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Code:

(prelude-require-packages '(org-pomodoro))

(add-to-list 'auto-mode-alist '("\\.org\\’" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-log-done t)

(defun prelude-org-mode-defaults ()
  (let ((oldmap (cdr (assoc 'prelude-mode minor-mode-map-alist)))
        (newmap (make-sparse-keymap)))
    (set-keymap-parent newmap oldmap)
    (define-key newmap (kbd "C-c +") nil)
    (define-key newmap (kbd "C-c -") nil)
    (make-local-variable 'minor-mode-overriding-map-alist)
    (push `(prelude-mode . ,newmap) minor-mode-overriding-map-alist))
)

(setq prelude-org-mode-hook 'prelude-org-mode-defaults)

(add-hook 'org-mode-hook (lambda () (run-hooks 'prelude-org-mode-hook)))

;; Keybindings
(global-set-key (kbd "<f6>") 'org-agenda)
(global-set-key (kbd "<f7>") 'org-clock-goto)
(global-set-key (kbd "<f8>") 'org-clock-in)
(global-set-key (kbd "<f9>") 'org-pomodoro)

;; Org directory and agenda files
(setq org-directory "~/Dropbox/org")
(setq org-agenda-files (list "~/Dropbox/org"))

;; Org keywords and faces
(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "STARTED(s)" "|" "DONE(d)")
              (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELED(c@/!)"))))

(setq org-todo-keyword-faces
      (quote
       (("TODO" :foreground "red" :weight bold)
        ("STARTED" :foreground "dodger blue" :weight bold)
        ("DONE" :foreground "forest green" :weight bold)
        ("WAITING" :foreground "orange" :weight bold)
        ("HOLD" :foreground "magenta" :weight bold)
        ("CANCELED" :foreground "forest green" :weight bold)

        ("ADDED" :foreground "red" :weight bold)
        ("DOWNLOADED" :foreground "dodger blue" :weight bold)
        ("IMPORTED" :foreground "orange" :weight bold)
        ("LISTENED" :foreground "forest green" :weight bold))))

;; State triggers
(setq org-todo-state-tags-triggers
      (quote (("CANCELED" ("CANCELED" . t))
              ("WAITING" ("WAITING" . t))
              ("HOLD" ("WAITING" . t) ("HOLD" . t))
              (done ("WAITING") ("HOLD"))
              ("TODO" ("WAITING") ("CANCELED") ("HOLD"))
              ("STARTED" ("WAITING") ("CANCELED") ("HOLD"))
              ("DONE" ("WAITING") ("CANCELED") ("HOLD")))))

;; Use fast todo selection
(setq org-use-fast-todo-selection t)

;; Resume clocking task when emacs is restarted
(org-clock-persistence-insinuate)

;; Show lot sof clocking history so it's easy to pick items off the C-F11 list
(setq org-clock-history-length 36)

;; Resume clocking task on clock-in if the clock is open
(setq org-clock-in-resume t)

;; Change tasks to STARTED when clocking in
(setq org-clock-in-switch-to-state "STARTED")

;; Separate drawers for clocking and logs
(setq org-drawers (quote ("PROPERTIES" "LOGBOOK")))

;; Save clock data and state changes and notes in the LOGBOOK drawer
(setq org-clock-into-drawer t)

;; Sometimes I change tasks I'm clocking quickly - this removes clocked tasks with 0:00 duration
(setq org-clock-out-remove-zero-time-clocks t)

;; Clock out when moving task to a done state
(setq org-clock-out-when-done t)

;; Save the running clock and all clock history when exiting Emacs, load it on startup
(setq org-clock-persist t)

;; Do not prompt to resume an active clock
(setq org-clock-persist-query-resume nil)

;; Enable auto clock resolution for finding open clocks
(setq org-clock-auto-clock-resolution (quote when-no-clock-is-running))

;; Include current clocking task in clock reports
(setq org-clock-report-include-clocking-task t)

;; Set default column format
(setq org-columns-default-format
      "%40ITEM %TODO %5Effort(Effort){:} %6CLOCKSUM")

;; Enable org-indent-mode
(setq org-startup-indented t)

;; Handle empty lines
(setq org-cycle-separator-lines 0)
(setq org-blank-before-new-entry (quote ((heading)
                                         (plain-list-item . auto))))

;; Babel
(setq org-plantuml-jar-path "~/.bin/plantuml.jar")
(add-hook 'org-babel-after-execute-hook 'personal-display-inline-images 'append)

;; Make babel results blocks lowercase
(setq org-babel-results-keyword "results")
(defun personal-display-inline-images ()
  (condition-case nil
      (org-display-inline-images)
    (error nil)))
(org-babel-do-load-languages
 (quote org-babel-load-languages)
 (quote ((emacs-lisp . t)
         (dot . t)
         (R . t)
         (python . t)
         (ruby . t)
         (gnuplot . t)
         (clojure . t)
         (scheme . t)
         (sh . t)
         (ledger . t)
         (org . t)
         (plantuml . t)
         (latex . t))))

(setq org-src-fontify-natively t)

;; Do not prompt to confirm evaluation
;; This may be dangerous - make sure you understand the consequences
;; of setting this -- see the docstring for details
(setq org-confirm-babel-evaluate nil)
;; Use fundamental mode when editing plantuml blocks with C-c '
(add-to-list 'org-src-lang-modes (quote ("plantuml" . fundamental)))

(provide 'prelude-org)

;;; prelude-org.el ends here
