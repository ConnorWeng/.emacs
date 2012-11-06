(provide 'styles)

;;set default font
(set-default-font "Consolas-10")

;;Style for Connor.Weng
(setq-default indent-tabs-mode nil) ;; M-x untabify to replace all tabs with spaces
;; M-x whitespace-cleanup to remove all useless white spaces

(defconst my-c-style
  '((c-basic-offset . 4)
    (c-tab-always-indent . t)
    (c-hanging-braces-alist . ((substatement-open after)
                               (inline-open after)
                               (defun-open after)
                               (brace-list-open)))
    (c-hanging-colons-alist . ((member-init-intro before)
                               (inher-intro)
                               (case-label after)
                               (label after)
                               (access-label after)))
    (c-cleanup-list . (scope-operator
                       defun-close-semi
                       brace-else-brace
                       brace-elseif-brace
                       ))
    (c-offsets-alist . ((arglist-close . c-lineup-arglist)
                        (substatement-open . 0)
                        (case-label . 4)
                        (block-open . 0)
                        (knr-argdecl-intro . -)
                        (defun-block-intro . 4)))
    (c-echo-syntactic-information-p . t))
  "CW Style")
(c-add-style "CW" my-c-style)

;; Customizations for all modes in CC Mode.
(defun my-c-mode-common-hook ()
  ;; set my personal style for the current buffer
  (c-set-style "CW")
  ;; other customizations
  (setq tab-width 4
        ;; this will make sure spaces are used instead of tabs
        indent-tabs-mode nil)
  ;; we don't like auto-newline, also not hungry-delete
  (c-toggle-auto-newline -1))
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
;;end Style for Connor.Weng

;;color-theme
(require 'color-theme)
(color-theme-initialize)
(color-theme-tomorrow-night)

;;set style
(add-hook 'jde-mode-hook
          '(lambda()
             (c-set-style "cw")))

(add-hook 'php-mode-hook
          '(lambda()
             (c-set-style "cw")))

;;set js indent
(setq js-indent-level 4)
