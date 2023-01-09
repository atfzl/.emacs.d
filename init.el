(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(load-theme 'leuven t)
(require 'olivetti)
(add-hook 'text-mode-hook #'olivetti-mode)
(add-hook 'org-mode-hook #'org-indent-mode)
(set-frame-font "Iosevka 20" nil t)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-visual-line-mode)
;; use space instead of tab for indentation
(setq-default indent-tabs-mode nil)
;; tab width global
(setq-default tab-width 2)
;; Don't save backup files
(setq make-backup-files nil)


;;; from melpa
;; undo-tree
(global-undo-tree-mode)
(setq undo-tree-auto-save-history nil)

