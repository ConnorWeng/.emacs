;;******************************[Init]*******************************
;; find ./ -name "*.java" -or -name "*.h" -print | etags -
;; recalls your last command C-x ESC ESC

;; order matters
(add-to-list 'load-path "f:/Workspace/LISP/.emacs/")
(require 'variables)
(require 'modes)
(require 'styles)
(require 'functions)
(require 'gkeys)

