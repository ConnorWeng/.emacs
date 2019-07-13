;;; variables.el --- set variables

;;; Commentary:

;;; Code:

;; always prefer UTF-8 to ISO-8859-1
(prefer-coding-system 'utf-8-unix)

;; try to fix the problem of emacs hanging up every few minutes
;; see http://stackoverflow.com/questions/2007329/emacs-23-1-50-1-hangs-ramdomly-for-6-8-seconds-on-windows-xp
(setq w32-get-true-file-attributes nil)

;; for emacs24 and ecb
(setq stack-trace-on-error t)

;;see http://www.masteringemacs.org/articles/2011/10/02/improving-performance-emacs-display-engine/
(setq redisplay-dont-pause t)

;;no '~' file
(setq make-backup-files nil)

;; use org-mode to implement GTD
(setq org-refile-use-outline-path 'file) ; without this line the org-refile does not work
(setq org-todo-keywords '((sequence "TODO(t)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)")))
(setq org-agenda-files '("~/Workspace/gtd/inbox.org"
                         "~/Workspace/gtd/gtd.org"
                         "~/Workspace/gtd/tickler.org"))
(setq org-capture-templates '(("t" "Todo [inbox]" entry
                               (file+headline "~/Workspace/gtd/inbox.org" "Tasks")
                               "* TODO %i%?")
                              ("i" "Item [inbox]" entry
                               (file+headline "~/Workspace/gtd/inbox.org" "Tasks")
                               "* %i%?")
                              ("T" "Tickler" entry
                               (file+headline "~/Workspace/gtd/tickler.org" "Tickler")
                               "* %i%? \n %U")))
(setq org-refile-targets '(("~/Workspace/gtd/gtd.org" :maxlevel . 3)
                           ("~/Workspace/gtd/someday.org" :level . 1)
                           ("~/Workspace/gtd/tickler.org" :maxlevel . 2)))
(setq org-agenda-custom-commands
      '(("i" "At the ICBC" tags-todo "@icbc"
         ((org-agenda-overriding-header "icbc")
          (org-agenda-skip-function #'my-org-agenda-skip-all-siblings-but-first)))))
(defun my-org-agenda-skip-all-siblings-but-first ()
  "Skip all but the first non-done entry."
  (let (should-skip-entry)
    (unless (org-current-is-todo)
      (setq should-skip-entry t))
    (save-excursion
      (while (and (not should-skip-entry) (org-goto-sibling t))
        (when (org-current-is-todo)
          (setq should-skip-entry t))))
    (when should-skip-entry
      (or (outline-next-heading)
          (goto-char (point-max))))))
(defun org-current-is-todo ()
  (string= "TODO" (org-get-todo-state)))

(provide 'variables)
;;; variables.el ends here
