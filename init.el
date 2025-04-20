(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(setq inhibit-startup-screen t)
(load-theme 'leuven t)
(add-hook 'org-mode-hook #'org-indent-mode)
(setq org-startup-with-inline-images t)
(set-frame-font "JetBrains Mono 14" nil t)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-visual-line-mode)
;; window size
;; (add-to-list 'default-frame-alist '(fullscreen . maximized))
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
;; Disable the annoying alarms
(setq ring-bell-function 'ignore)
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

;; Ctrl-K with no kill
(defun delete-line-no-kill ()
  "Do not cut line with Control-k, just remove it."
  (interactive)
  (delete-region
   (point)
   (save-excursion (move-end-of-line 1) (point)))
  (delete-char 1)
  )
(global-set-key (kbd "C-k") 'delete-line-no-kill)

;;; from melpa
;;;

(use-package olivetti
  :ensure t
  :config
  (add-hook 'text-mode-hook #'olivetti-mode)
  )

(use-package org-journal
  :ensure t
  :defer t
  :config
  (setq org-journal-dir "~/Library/Mobile Documents/com~apple~CloudDocs/notes/journal"
        org-journal-date-format "%A, %d %B %Y"
        org-journal-file-format "%Y-%m-%d.org")
  :init
  (global-set-key (kbd "C-c C-j") 'org-journal-new-entry)
  (global-set-key (kbd "C-c C-f") 'org-journal-next-entry)
  (global-set-key (kbd "C-c C-b") 'org-journal-previous-entry)
)

(use-package undo-tree
  :ensure t
  :config
  (setq undo-tree-auto-save-history nil)
  :init
  (global-undo-tree-mode)
  )

(use-package git-auto-commit-mode
  :ensure t
  :config
  (setq gac-automatically-push-p t)
  (setq gac-automatically-add-new-files-p t)
  (setq gac-silent-message-p t)
  )

(use-package git-timemachine
  :ensure t
  )

(use-package ultra-scroll
  :vc (:url "https://github.com/jdtsmith/ultra-scroll") ; For Emacs>=30
  :init
  (setq scroll-conservatively 101 ; important!
        scroll-margin 0)
  :config
  (ultra-scroll-mode 1))

;; (use-package smooth-scrolling
;;   :ensure t
;;   :init
;;   (smooth-scrolling-mode 1)
;;   (setq smooth-scroll-margin 5)
;;   )

(use-package projectile
  :ensure t
  :init
  (setq projectile-completion-system 'helm)
  :config
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (projectile-mode +1)
  )

(use-package helm-projectile
  :ensure t
  :after helm
  :config
  ;; turn on helm-projectile
  (helm-projectile-on)
  )

(use-package helm-ag
  :ensure t
  )

(use-package helm
  :ensure t
  :init
  (setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
        helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
        helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
        helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
        helm-ff-file-name-history-use-recentf t)

  :config
  (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
  (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
  (define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z
  (global-set-key (kbd "C-x C-f") 'helm-find-files)

  (helm-mode 1)
  (helm-autoresize-mode t)

  (global-set-key (kbd "C-x b") 'helm-mini)
  (global-set-key (kbd "C-x C-b") 'helm-mini)
  (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key (kbd "M-y") 'helm-show-kill-ring)
  (global-set-key (kbd "C-c h x") 'helm-register)
  )

(use-package helm-swoop
  :ensure t
  :config
  (global-set-key (kbd "s-f") 'helm-swoop)
  ;; (global-set-key (kbd "M-I") 'helm-swoop-back-to-last-point)
  (global-set-key (kbd "C-c M-i") 'helm-multi-swoop)
  (global-set-key (kbd "C-x M-i") 'helm-multi-swoop-all)

  ;; When doing isearch, hand the word over to helm-swoop
  (define-key isearch-mode-map (kbd "M-i") 'helm-swoop-from-isearch)
  ;; From helm-swoop to helm-multi-swoop-all
  (define-key helm-swoop-map (kbd "M-i") 'helm-multi-swoop-all-from-helm-swoop)

  ;; Instead of helm-multi-swoop-all, you can also use helm-multi-swoop-current-mode
  (define-key helm-swoop-map (kbd "M-m") 'helm-multi-swoop-current-mode-from-helm-swoop)

  ;; Move up and down like isearch
  (define-key helm-swoop-map (kbd "C-r") 'helm-previous-line)
  (define-key helm-swoop-map (kbd "C-s") 'helm-next-line)
  (define-key helm-multi-swoop-map (kbd "C-r") 'helm-previous-line)
  (define-key helm-multi-swoop-map (kbd "C-s") 'helm-next-line)
  )

;; (use-package org-roam
;;   :ensure t
;;   :init
;;   (setq org-roam-directory (file-truename "~/Library/Mobile Documents/com~apple~CloudDocs/notes/"))
;;   ;; (setq org-roam-dailies-directory "daily/")
;;   ;; (setq org-roam-dailies-capture-templates
;;   ;;       '(("d" "default" entry
;;   ;;          "* %?"
;;   ;;          :target (file+head "%<%Y-%m-%d>.org"
;;   ;;                             "#+title: %<%Y-%m-%d>\n"))))
;;   :config
;;   (org-roam-db-autosync-mode)
;;   (setq org-roam-mode-sections
;;       (list #'org-roam-backlinks-section
;;             #'org-roam-reflinks-section
;;             #'org-roam-unlinked-references-section
;;             ))
;;   )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("e7820b899036ae7e966dcaaec29fd6b87aef253748b7de09e74fdc54407a7a02"
     "1781e8bccbd8869472c09b744899ff4174d23e4f7517b8a6c721100288311fa5"
     default))
 '(org-link-file-path-type 'relative)
 '(package-selected-packages
   '(company-ledger git-auto-commit-mode git-timemachine helm-ag
                    helm-swoop ledger-mode nano olivetti org-roam
                    prettier smooth-scrolling undo-tree use-package))
 '(package-vc-selected-packages
   '((ultra-scroll :url "https://github.com/jdtsmith/ultra-scroll"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
