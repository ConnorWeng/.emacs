;;******************************[Init]*******************************
;; find ./ -name "*.java" -or -name "*.h" -print | etags -
;; recalls your last command C-x ESC ESC

(add-to-list 'load-path emacs-config-path)
(add-to-list 'load-path (concat emacs-config-path "third_party/"))

;; order matters
(require 'variables)
(require 'modes)
(require 'styles)
(require 'functions)
(require 'gkeys)
(require 'packages)
