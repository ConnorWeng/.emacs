;;; variables.el --- set variables

;;; Commentary:

;;; Code:

;; set initial buffer
(setq initial-buffer-choice "c:/Users/Connor/Desktop/todo.org")

;; always prefer UTF-8 to ISO-8859-1
(prefer-coding-system 'utf-8-unix)

;; try to fix the problem of emacs hanging up every few minutes
;; see http://stackoverflow.com/questions/2007329/emacs-23-1-50-1-hangs-ramdomly-for-6-8-seconds-on-windows-xp
(setq w32-get-true-file-attributes nil)

;; for emacs24 and ecb
(setq stack-trace-on-error t)

;;see http://www.masteringemacs.org/articles/2011/10/02/improving-performance-emacs-display-engine/
(setq redisplay-dont-pause t)

;;no '~' file
(setq make-backup-files nil)

(provide 'variables)
;;; variables.el ends here
