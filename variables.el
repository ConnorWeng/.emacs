(provide 'variables)

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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(jde-global-classpath (quote ("$JAVA_HOME/")))
 '(jde-help-docsets (quote (("JDK API" "http://java.sun.com/javase/6/docs/api" nil))))
 '(jde-jdk-doc-url "http://docs.oracle.com/javase/6/docs/api/")
 '(jde-jdk-registry (quote (("1.6.0" . "C:\\Program Files\\Java\\jdk1.6.0_26")))))
