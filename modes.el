(provide 'modes)

;; nxhtml-mode
(require 'nxhtml-mode)

;; CoffeeScript-mode
(require 'coffee-mode)
(defun coffee-custom ()
  "coffee-mode-hook"
  (set (make-local-variable 'tab-width) 4)
  (set (make-local-variable 'coffee-tab-width) 4)
  (local-set-key (kbd "C-j") 'coffee-newline-and-indent))
(add-hook 'coffee-mode-hook
          '(lambda() (coffee-custom)))

;; yasnippet minor-mode
(require 'yasnippet)
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

;;enable auto revert mode
(global-auto-revert-mode)
(setq auto-revert-interval 30)

;;org-mode
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(org-indent-mode)
;;Make org-mode auto line wrap
(add-hook 'org-mode-hook
          (lambda() (setq truncate-lines nil)))


;;tabbar-mode
(require 'tabbar)
(tabbar-mode)

;;show-paren-mode
(show-paren-mode)

;;Set php-mode
(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(defun clean-php-mode ()
  (interactive)
  (php-mode)
  (setq c-basic-offset 2) ; 2 tabs indenting
  (setq indent-tabs-mode nil)
  (setq fill-column 78)
  (c-set-offset 'case-label '+)
  (c-set-offset 'arglist-close 'c-lineup-arglist-operators))
(c-set-offset 'arglist-intro '+) ; for FAPI arrays and DBTNG
(c-set-offset 'arglist-cont-nonempty 'c-lineup-math) ; for DBTNG fields and values
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))

(defun my-php-mode-hook()
                                        ;(setq c-basic-offset 2)
                                        ;(c-set-offset 'defun-block-intro '+)
  (local-set-key (kbd "RET") 'newline-and-indent))
(add-hook 'php-mode-hook 'my-php-mode-hook)


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

;;ecb
(require 'ecb)
(setq ecb-tip-of-the-day nil)

;;jdee
(require 'jde)

;;enable hs-minor-mode
(add-hook 'jde-mode-hook 'hs-minor-mode)

;;auto complete
(require 'auto-complete-config)
(ac-config-default)
(global-auto-complete-mode 1)

;;markdown-mode
(require 'markdown-mode)
(setq auto-mode-alist
      (cons '("\\.md" . markdown-mode) auto-mode-alist))

;;auto cleanup whitespace
(add-hook 'before-save-hook '(lambda() (whitespace-cleanup)))

;;move lines
(require 'move-lines)
(move-lines-binding)
