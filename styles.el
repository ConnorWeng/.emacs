(provide 'styles)

;;set default font
(set-default-font "Consolas-10")

;;Style for Connor.Weng
(setq-default indent-tabs-mode nil) ;; M-x untabify to replace all tabs with spaces
;; M-x whitespace-cleanup to remove all useless white spaces

;;color-theme
(require 'color-theme)
(color-theme-initialize)
(color-theme-tomorrow-night)

;;set js indent
(setq js-indent-level 4)

;;use google-c-style
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
