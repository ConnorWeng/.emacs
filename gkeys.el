;;; gkeys.el --- set keys

;;; Commentary:

;;; Code:

(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)

(global-set-key (kbd "<f5>") 'kmacro-end-and-call-macro)

(global-set-key (kbd "<f8>") 'flymake-goto-next-error)
(global-set-key (kbd "<f7>") 'flymake-goto-prev-error)
(global-set-key (kbd "<f6>") 'flymake-display-err-menu-for-current-line)

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(global-set-key "\C-ce" '(lambda () (interactive) (org-export-as-html nil nil nil nil t nil)))

(global-set-key [(control tab)] 'semantic-ia-complete-symbol-menu)
(global-set-key "\C-xj" 'semantic-ia-fast-jump)

(global-set-key (kbd "M-/") 'auto-complete)

(global-set-key (kbd "C-x C-b") 'ibuffer)

(global-set-key (kbd "M-g s t") 'magit-status)
(add-hook 'magit-log-mode-hook
          (lambda () (local-set-key (kbd "X") 'magit-reset-head-hard)))

(global-set-key (kbd "C-x f") 'find-file-in-repository)

;; For Linux
(global-set-key (kbd "<C-mouse-4>") 'text-scale-increase)
(global-set-key (kbd "<C-mouse-5>") 'text-scale-decrease)

;; For Windows
(global-set-key (kbd "<C-wheel-up>") 'text-scale-increase)
(global-set-key (kbd "<C-wheel-down>") 'text-scale-decrease)

(global-set-key (kbd "C-.") 'imenu)

(global-set-key (kbd "C-x p") '(lambda () (interactive) (other-window -1)))

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

(global-set-key (kbd "C-M-<mouse-1>") 'mc/add-cursor-on-click)
(global-set-key (kbd "C-c SPC") 'ace-jump-mode)

(global-set-key (kbd "C-j") 'newline-and-indent)

(provide 'gkeys)
;;; gkeys.el ends here
