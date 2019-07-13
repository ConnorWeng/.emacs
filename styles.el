;;; styles.el --- config styles

;;; Commentary:

;;; Code:

;;set default font
;; (set-default-font "Consolas-10")
;; Setting English Font
(set-face-attribute
  'default nil :font "Consolas 11")
;; Chinese Font
(dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font)
                      charset
                      (font-spec :family "Microsoft Yahei Light" :size 16)))

;;Style for Connor.Weng
(setq-default indent-tabs-mode nil) ;; M-x untabify to replace all tabs with spaces
;; M-x whitespace-cleanup to remove all useless white spaces

;;load-theme
(load-theme 'molokai t)

;;set js indent
(setq js-indent-level 2)
(setq js2-basic-offset 2)
(setq js2-indent-switch-body 1)
(setq web-mode-code-indent-offset 2)

;;use google-c-style
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)

(add-hook 'html-mode-hook
          (lambda ()
            ;; Default indentation is usually 2 spaces, changing to 4.
            (set (make-local-variable 'sgml-basic-offset) 4)))

(provide 'styles)
;;; styles.el ends here
