;;; styles.el --- config styles

;;; Commentary:

;;; Code:

;;set default font
(set-default-font "Consolas-10")

;;Style for Connor.Weng
(setq-default indent-tabs-mode nil) ;; M-x untabify to replace all tabs with spaces
;; M-x whitespace-cleanup to remove all useless white spaces

;;load-theme
(load-theme 'molokai t)

;;set js indent
(setq js-indent-level 2)
(setq js2-basic-offset 2)
(setq js2-indent-switch-body 1)

;;use google-c-style
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)

(add-hook 'html-mode-hook
          (lambda ()
            ;; Default indentation is usually 2 spaces, changing to 4.
            (set (make-local-variable 'sgml-basic-offset) 4)))

(provide 'styles)
;;; styles.el ends here
