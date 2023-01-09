(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(load-theme 'leuven t)
(add-hook 'org-mode-hook #'org-indent-mode)
(setq org-startup-with-inline-images t)
(set-frame-font "Iosevka 18" nil t)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-visual-line-mode)
;; window size
(add-to-list 'default-frame-alist '(fullscreen . maximized))
;; use space instead of tab for indentation
(setq-default indent-tabs-mode nil)
;; tab width global
(setq-default tab-width 2)
;; Don't save backup files
(setq make-backup-files nil)
;; writing yes or no is length, type y / n instead
(defalias 'yes-or-no-p 'y-or-n-p)
;; show the cursor like this |
(setq-default cursor-type 'bar)
(setq-default show-trailing-whitespace t)
;; refresh buffers automatically if changed by ext program
(global-auto-revert-mode 1)
;; buffer path in bar
(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))
(defun init ()
  "Shortcut to reach init.el ."
  (interactive)
  (find-file "~/.emacs.d/init.el")
  )
(global-set-key (kbd "C-c C-j") 'org-journal-new-entry)
(setq initial-buffer-choice "~/org/inbox.org")

;;; from melpa
;;;
;; olivetti
(require 'olivetti)
(add-hook 'text-mode-hook #'olivetti-mode)
;; undo-tree
(global-undo-tree-mode)
(setq undo-tree-auto-save-history nil)
;; smooth-scrolling
(require 'smooth-scrolling)
(smooth-scrolling-mode 1)
(setq smooth-scroll-margin 5)
(vertico-mode 1)
;; unnecessary whitespace must be cleaned up
(global-whitespace-cleanup-mode)
;; projectile
(projectile-mode +1)
;; Recommended keymap prefix on macOS
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(gac-automatically-push-p t)
 '(gac-silent-message-p t)
 '(org-journal-date-format "%A, %d/%m/%y")
 '(org-journal-dir "~/org/Journal/")
 '(package-selected-packages
   '(flx-ido ag projectile whitespace-cleanup-mode literate-calc-mode vertico org-journal smooth-scrolling git-auto-commit-mode undo-tree olivetti)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
