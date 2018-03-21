;;; modes.el --- set up modes

;;; Commentary:

;;; Code:

;; coffee-mode
(eval-after-load "coffee-mode"
  '(progn
     (defun coffee-npm-test ()
       (interactive)
       (let* ((full-file-name (expand-file-name buffer-file-name))
              (project-dir (parent-directory (file-name-directory full-file-name))))
         (print project-dir)
         (print (shell-command-to-string (concat "cd " project-dir " && npm test")))))
     (defun coffee-command-compile (input &optional output)
       "Modified by ConnorWeng in order to support change output dir."
       (let* ((full-file-name (expand-file-name input))
              (output-dir (concat (parent-directory (file-name-directory full-file-name)) "lib")))
         (unless (file-directory-p output-dir)
           (make-directory output-dir t))
         (format "%s %s -o %s %s"
                 (shell-quote-argument coffee-command)
                 (coffee-command-compile-arg-as-string output)
                 (shell-quote-argument output-dir)
                 (shell-quote-argument full-file-name))))
     (define-key coffee-mode-map (kbd "C-c C-,") 'coffee-npm-test)))
(custom-set-variables '(coffee-tab-width 2))

;; php-mode
(require 'php-auto-yasnippets)
(add-hook 'php-mode-hook (lambda ()
                           (local-set-key (kbd "C-.") 'imenu)
                           (local-set-key (kbd "C-x j") 'php-show-arglist)
                           (payas/ac-setup)
                           (ggtags-mode 1)))

;; yasnippet minor-mode
(require 'yasnippet)
(setq yas/snippet-dirs (cons (concat emacs-config-path "snippets/") yas/snippet-dirs))
(yas/global-mode 1)

;;magit-mode
(eval-after-load "vc" '(remove-hook 'find-file-hooks 'vc-find-file-hook)) ;remove vc-git
(require 'magit)

;;C# mode
(require 'csharp-mode)

(add-hook 'js-mode-hook
          (lambda() (local-set-key "\M-." 'find-tag)))

;;use rjsx-mode instead of javascript-mode
(add-to-list 'auto-mode-alist '("\\.js\\'" . rjsx-mode))
(add-to-list 'auto-mode-alist '("\\.json\\'" . rjsx-mode))

;;enable auto revert mode
(global-auto-revert-mode)
(setq auto-revert-interval 30)

;;org-mode
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

;;Make org-mode auto line wrap
(add-hook 'org-mode-hook
          (lambda()
            (org-indent-mode)
            (setq truncate-lines nil)))

;;show-paren-mode
(show-paren-mode)

;;hide tool bar
(tool-bar-mode -1);;for emacs24
(menu-bar-mode -1);;for emacs24
(scroll-bar-mode -1);;for emacs24

;;cedet
(require 'cedet)
(global-ede-mode 1) ;Enable the Project management system
(semantic-mode 1)

;;enable hs-minor-mode
(add-hook 'jde-mode-hook 'hs-minor-mode)

;;auto complete
(require 'auto-complete-config)
(ac-config-default)
(defun auto-complete-mode-maybe ()
  "No maybe for you.  Only AC!"
  (unless (minibufferp (current-buffer))
    (auto-complete-mode 1)))

;;markdown-mode
(require 'markdown-mode)
(setq auto-mode-alist
      (cons '("\\.md" . markdown-mode) auto-mode-alist))

;;auto cleanup whitespace
(add-hook 'before-save-hook '(lambda() (whitespace-cleanup)))

;;move lines
(require 'move-lines)
(move-lines-binding)

;;helm-mode
(require 'helm-config)
(helm-mode 1)

;;auto pair
(electric-pair-mode 1)

;;web-mode
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode))

;;emmet-mode
(require 'emmet-mode) ;cannot modify the keymap without requiring the mode first
(define-key emmet-mode-keymap (kbd "<tab>") 'emmet-expand-line)
(define-key emmet-mode-keymap (kbd "C-j") 'newline-and-indent)
(add-hook 'web-mode-hook 'emmet-mode)

(powerline-default-theme)

(winner-mode 1)

(setq auto-save-buffers-enhanced-interval 30)
(auto-save-buffers-enhanced t)

(electric-indent-mode 1)

(add-hook 'after-init-hook #'global-flycheck-mode)

(setq c-mode-hook
      '(lambda ()
        (ggtags-mode 1)))

(desktop-save-mode 1)

(provide 'modes)
;;; modes.el ends here
