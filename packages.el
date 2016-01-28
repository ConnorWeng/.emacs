(provide 'packages)

(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

(defvar my-packages '(js2-mode
                      magit
                      evernote-mode
                      highlight-indentation
                      auto-complete
                      yasnippet
                      ssh
                      powerline
                      move-line
                      jdee
                      coffee-mode
                      find-file-in-repository
                      php-mode
                      php-auto-yasnippets
                      auto-save-buffers-enhanced
                      helm
                      helm-ag
                      csharp-mode
                      emmet-mode
                      json-reformat
                      sbt-mode
                      web-mode
                      markdown-mode))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))
