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
        '("~/org/gtd/gtd.org" "~/org/gtd/tickler.org")))

(setq org-capture-templates '(("t" "Todo [inbox]" entry
                               (file+headline "~/org/gtd/inbox.org" "Tasks")
                               "* %i%?")
                              ("T" "Tickler" entry
                               (file+headline "~/org/gtd/tickler.org" "Tickler")
                               "* %i%? \n %U")))
(setq org-refile-targets '(("~/org/gtd/gtd.org" :maxlevel . 3)
                           ("~/org/gtd/someday.org" :maxlevel . 3)
                           ("~/org/gtd/tickler.org" :maxlevel . 2)))

;; (setq org-archive-location "~/org/gtd/archive/")

(setq org-todo-keywords '((sequence "TODO(t)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)")))

(setq org-todo-keyword-faces
  '(("TODO" . "#FC474F")
    ("WAITING" . "#ff9e14")
    ("MAYBE" . "#0276ff")
    ("DONE" . "#71aa62")
    ("CANCELLED" . "#6539b6")))

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
(setq org-outline-path-complete-in-steps nil)
(setq org-refile-use-outline-path (quote file))
(setq org-enforce-todo-dependencies t)

(add-hook 'org-mode-hook 'org-indent-mode)

(provide 'init-org)
;;; init-org.el ends here
