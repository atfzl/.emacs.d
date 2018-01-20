;; cask
(require 'cask "/usr/local/share/emacs/site-lisp/cask/cask.el")
(cask-initialize)

;; (setq package-enable-at-startup nil)
;; (package-initialize)

;; load path so that configs from lisp folder can be required
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; (require 'init-melpa)
(require 'init-general)
(require 'init-helm)
(require 'init-projectile)
(require 'init-magit)
(require 'init-yasnippet)
(require 'init-company)
(require 'init-helm-swoop)
(require 'init-org)
(require 'init-extensions)
(require 'init-functions)
(require 'init-dired)
(require 'init-scss)
(require 'init-css)
(require 'init-theme)
(require 'init-mc)
(require 'init-cpp)
(require 'init-go)
(require 'init-javascript)
(require 'init-haskell)
(require 'init-lisp)
(require 'init-keys)

;; server
(server-start)

;; file with custom-set-variables
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;;; init.el ends here
