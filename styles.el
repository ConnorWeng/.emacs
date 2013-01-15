(provide 'styles)

;;set default font
(set-frame-font "Monaco-8")
(set-fontset-font "fontset-default" 'han '("Microsoft YaHei" . "unicode-bmp"))

;;Style for Connor.Weng
(setq-default indent-tabs-mode nil) ;; M-x untabify to replace all tabs with spaces
;; M-x whitespace-cleanup to remove all useless white spaces

(setq-default tab-width 4)

;;load-theme
(load-theme 'molokai t)

;;set js indent
(setq js-indent-level 2)
(setq js2-basic-offset 2)

;;use google-c-style
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)

(add-hook 'sql-mode-hook
          '(lambda()
             (set (make-local-variable 'indent-tabs-mode) nil)))

(add-hook 'html-mode-hook
          (lambda ()
            ;; Default indentation is usually 2 spaces, changing to 4.
            (set (make-local-variable 'sgml-basic-offset) 4)))
