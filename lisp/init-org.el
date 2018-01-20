;;; Commentary:
;; org-mode configuration

;;; Code:

(require 'org)

;; (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

(setq org-src-fontify-natively t)

(with-eval-after-load 'org
  (setq org-agenda-files
        '("~/org/personal.org" "~/org/work.org")))

;; ;; make org mode allow eval of some langs
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (js . t)))

;; to upport syntax highlighting when using #+BEGIN_SRC js
(add-to-list 'org-src-lang-modes '("js" . javascript))

;; stop emacs asking for confirmation
(setq org-confirm-babel-evaluate nil)

(setq org-hide-leading-stars t)
(setq org-log-done (quote time))
(setq org-log-into-drawer t)
(setq org-log-reschedule (quote note))
(setq org-refile-allow-creating-parent-nodes (quote confirm))
(setq org-refile-targets (quote ((org-agenda-files :level . 1))))
(setq org-refile-use-outline-path (quote file))
(setq org-enforce-todo-dependencies t)

(provide 'init-org)
;;; init-org.el ends here
