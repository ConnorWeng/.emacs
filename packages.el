;;; packages.el --- install packages

;;; Commentary:

;;; Code:

(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

(defvar my-packages '(js2-mode
                      magit
                      highlight-indentation
                      auto-complete
                      yasnippet
                      ssh
                      powerline
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
                      multiple-cursors
                      ace-jump-mode
                      markdown-mode
                      flycheck
                      ggtags
                      rjsx-mode
                      xref-js2))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(provide 'packages)
;;; packages.el ends here
