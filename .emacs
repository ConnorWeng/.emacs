;;******************************[Init]*******************************
;; find . -name "*.java" -or -name "*.h" -print | etags -
;; recalls your last command C-x ESC ESC

(add-to-list 'load-path emacs-config-path)
(add-to-list 'load-path (concat emacs-config-path "third_party/"))

;; error in evernote-mode as below, so use brew to install ruby193 and gdbm, exec-path should include /usr/local/bin as first element
;; error in process sentinel: enclient.rb exited abnormally with code 1
;; /System/Library/Frameworks/Ruby.framework/Versions/2.0/usr/lib/ruby/2.0.0/rubygems/core_ext/kernel_require.rb:55:in `require': cannot load such file -- gdbm (LoadError)
;;      from /System/Library/Frameworks/Ruby.framework/Versions/2.0/usr/lib/ruby/2.0.0/rubygems/core_ext/kernel_require.rb:55:in `require'
;;      from /usr/bin/enclient.rb:32:in `<main>'
(setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
(setq exec-path (append '("/usr/local/bin") exec-path))

;; order matters
(require 'packages)
(require 'variables)
(require 'modes)
(require 'styles)
(require 'functions)
(require 'gkeys)
