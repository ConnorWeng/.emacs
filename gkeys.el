(provide 'gkeys)

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

(global-set-key (kbd "C-,") 'tabbar-backward)
(global-set-key (kbd "C-.") 'tabbar-forward)

(global-set-key [(control tab)] 'semantic-ia-complete-symbol-menu)
(global-set-key "\C-xj" 'semantic-ia-fast-jump)

(global-set-key (kbd "M-/") 'auto-complete)

(global-set-key (kbd "C-x C-b") 'ibuffer)

(global-set-key (kbd "M-g s t") 'magit-status)
(add-hook 'magit-log-mode-hook
          (lambda () (local-set-key (kbd "X") 'magit-reset-head-hard)))
