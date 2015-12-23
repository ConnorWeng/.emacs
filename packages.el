(provide 'packages)

(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

(defvar my-packages '(clojure-mode
                      clojure-test-mode
                      cider
                      js2-mode
                      mmm-mode
                      highlight-indentation
                      auto-complete
                      sublimity
                      ssh
                      powerline
                      coffee-mode
                      find-file-in-repository
                      php-mode
                      yasnippet
                      auto-save-buffers-enhanced
                      helm
                      helm-ag
                      emmet-mode
                      json-reformat
                      sbt-mode
                      web-mode))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))
