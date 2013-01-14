(provide 'modes)

;; nxhtml-mode
(require 'nxhtml-mode)

;; coffee-mode
(eval-after-load "coffee-mode"
  '(progn
     (defun coffee-npm-test ()
       (interactive)
       (let* ((full-file-name (expand-file-name buffer-file-name))
              (project-dir (parent-directory (file-name-directory full-file-name))))
         (print project-dir)
         (print (shell-command-to-string (concat "cd " project-dir " && npm test")))))
     (define-key coffee-mode-map (kbd "C-c C-,") 'coffee-npm-test)))
(custom-set-variables '(coffee-tab-width 2))

;; php-mode
(require 'php-auto-yasnippets)
(add-hook 'php-mode-hook (lambda ()
                           (local-set-key (kbd "C-.") 'imenu)
                           (local-set-key (kbd "C-x j") 'php-show-arglist)
                           (payas/ac-setup)))

;; yasnippet minor-mode
(require 'yasnippet)
(setq yas/snippet-dirs (cons (concat emacs-config-path "snippets/") yas/snippet-dirs))
(yas/global-mode 1)

;;magit-mode
(eval-after-load "vc" '(remove-hook 'find-file-hooks 'vc-find-file-hook)) ;remove vc-git
(require 'magit)

;;C# mode
(require 'csharp-mode)

;;enable jslint
(require 'flymake-for-jslint-for-wsh "flymake-for-jslint-for-wsh.el")
(setq flymake-for-jslint-jslint-location "~/jslint-for-wsh.js")
(defun my-javascript-mode-fn ()
  (flymake-mode 1)
  )

;; use whichever javavscript mode you prefer
(add-hook 'javascript-mode-hook 'my-javascript-mode-fn)
;;(add-hook 'espresso-mode-hook 'my-javascript-mode-fn)

(add-hook 'js-mode-hook
          (lambda() (local-set-key "\M-." 'find-tag)))

;;use js2-mode instead of javascript-mode
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json\\'" . js2-mode))

;;enable auto revert mode
(global-auto-revert-mode)
(setq auto-revert-interval 30)

;;org-mode
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(org-indent-mode)
;;Make org-mode auto line wrap
(add-hook 'org-mode-hook
          (lambda() (setq truncate-lines nil)))

;;show-paren-mode
(show-paren-mode)

;;linum-mode
;;(linum-mode)
;;(global-linum-mode)
;;(setq linum-format "%3d")

;;hide tool bar
;;(tool-bar-mode nil)
;;(menu-bar-mode nil)
;;(scroll-bar-mode nil)
(tool-bar-mode -1);;for emacs24
(menu-bar-mode -1);;for emacs24
(scroll-bar-mode -1);;for emacs24

;;cedet
(require 'cedet)
(global-ede-mode 1) ;Enable the Project management system
(semantic-load-enable-code-helpers) ;Enable prototype help and smart completion
;;Disable semantic parser in html-mode because of conflict with mmm-mode
(add-to-list 'semantic-inhibit-functions
             (lambda ()
               (if (eq major-mode 'html-mode) t)))

;;jdee
(require 'jde)

;;enable hs-minor-mode
(add-hook 'jde-mode-hook 'hs-minor-mode)

;;auto complete
(require 'auto-complete-config)
(ac-config-default)
(defun auto-complete-mode-maybe ()
  "No maybe for you. Only AC!"
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

;;sqlplus-mode
(require 'sqlplus)
(add-to-list 'auto-mode-alist '("\\.sqp\\'" . sqlplus-mode))
(setq sqlplus-command "/usr/local/bin/sqlplus")

;;plsql-mode
(require 'plsql)
(setq auto-mode-alist
      (append '(("\\.pls\\'" . plsql-mode) ("\\.pkg\\'" . plsql-mode)
                ("\\.pks\\'" . plsql-mode) ("\\.pkb\\'" . plsql-mode)
                ("\\.sql\\'" . plsql-mode) ("\\.PLS\\'" . plsql-mode)
                ("\\.PKG\\'" . plsql-mode) ("\\.PKS\\'" . plsql-mode)
                ("\\.PKB\\'" . plsql-mode) ("\\.SQL\\'" . plsql-mode)
                ("\\.prc\\'" . plsql-mode) ("\\.fnc\\'" . plsql-mode)
                ("\\.trg\\'" . plsql-mode) ("\\.vw\\'" . plsql-mode)
                ("\\.PRC\\'" . plsql-mode) ("\\.FNC\\'" . plsql-mode)
                ("\\.TRG\\'" . plsql-mode) ("\\.VW\\'" . plsql-mode))
              auto-mode-alist ))

;;helm-mode
(require 'helm-config)
(helm-mode 1)

;;auto pair
(electric-pair-mode 1)

;;mmm-mode
(require 'mmm-auto)
(setq mmm-global-mode 'maybe)
(mmm-add-mode-ext-class 'html-mode "\\.html\\'" 'html-js)

;;sublimity-mode
;(require 'sublimity)
;(require 'sublimity-scroll)
;(require 'sublimity-map)
;(sublimity-global-mode)

(powerline-default-theme)

(winner-mode 1)

(setq auto-save-buffers-enhanced-interval 4)
(auto-save-buffers-enhanced t)

(require 'evernote-mode)
(setq evernote-enml-formatter-command '("w3m" "-dump" "-I" "UTF8" "-O" "UTF8"))
(setq evernote-developer-token "S=s14:U=370862:E=156e0e4ef05:C=14f8933c2f8:P=1cd:A=en-devtoken:V=2:H=df199f70f0b0801f9643190467b7d456")
