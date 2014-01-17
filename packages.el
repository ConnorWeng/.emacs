(provide 'packages)

(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(defvar my-packages '(clojure-mode
                      clojure-test-mode
                      cider))

(package-refresh-contents)

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))
