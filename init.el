;; basic --------------------------------------------
;;disable scroll bar and tool bar and menu bar
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))

;; disable splash screen
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)

;; save how emacs looked in previous session
;;(desktop-save-mode 1)

;; disable alarms
(setq ring-bell-function 'ignore)

(setq make-backup-files nil)

;; server
(server-start)

;; melpa
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
  (package-initialize))

;; execute path from shell
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))                                            

;; show line numbers globally      
(global-linum-mode 1)

;; artist mode, use right click instead of middle click
(eval-after-load "artist"
  '(define-key artist-mode-map [(down-mouse-3)]
     'artist-mouse-choose-operation)
  )

(setq js-indent-level 2)

(setq-default js2-global-externs '("before", "describe", "debugger"
                                   "arguments" "angular" "module"
                                   "require" "assert" "setTimeout"
                                   "clearTimeout" "setInterval"
                                   "clearInterval" "console" "JSON"))

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.rest\\'" . restclient-mode))
(add-to-list 'auto-mode-alist '("\\.es\\'" . es-mode))
(add-to-list 'auto-mode-alist '("\\.plant\\'" . puml-mode))
(add-to-list 'auto-mode-alist '("\\.art\\'" . artist-mode))

;; zsh sh-mode
(add-to-list 'auto-mode-alist '("\\.zsh\\'" . sh-mode))
(add-to-list 'auto-mode-alist '("\\.zsh-theme\\'" . sh-mode))

;; html mode for handlebars
(add-to-list 'auto-mode-alist '("\\.handlebars\\'" . web-mode))

;; open files by M-x
(defun gtd ()
  (interactive)
  (find-file "~/org/gtd.org")
  )

(defun todo ()
  (interactive)
  (find-file "~/org/todo.org")
  )

(defun init ()
  (interactive)
  (find-file "~/.emacs.d/init.el")
  )

(defun books ()
  (interactive)
  (find-file "~/org/books.org")
  )

;; refresh buffers automatically if changed by ext program
(global-auto-revert-mode 1)

;; load custom theme
(load-theme 'base16-monokai-dark t)

;; font
;;(set-default-font "Inconsolata 14")

(require 'session)
(add-hook 'after-init-hook 'session-initialize)
(session-initialize)

;; hide leading stars
(setq org-hide-leading-stars t)
;; org-mode indent 
;;(setq org-startup-indented t)

;; highlight indentation color
                                        ;(require 'highlight-indentation)
;;(set-face-background 'highlight-indentation-face "DarkGray")
;;(set-face-background 'highlight-indentation-current-column-face "Gray")

;; new files are opened in same frame
;;(setq ns-pop-up-frames nil)

;; buffer path in bar
(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))

;; window size 
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; truncate lines
;;(set-default 'truncate-lines t)

;; show column numbers
(setq column-number-mode t)

;; smooth scrolling
;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time

(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling

(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse

(setq scroll-step 1) ;; keyboard scroll one line at a time

;; allow narrow-to-region
(put 'narrow-to-region 'disabled nil)

;; use space instead of tab for indentation
(setq-default indent-tabs-mode nil)

;; tab width global
(setq-default tab-width 2)

;; show parenthesis mode
(show-paren-mode 1)

;; electric pair mode
(electric-pair-mode 1)

;; ;; javascript with node
;; (add-hook 'js2-mode-hook
;;           (lambda ()
;;             (set (make-local-variable 'compile-command)
;;                  (concat "node " buffer-file-name))))

;; ;; compile c++
;; (add-hook 'c++-mode-hook
;;           (lambda ()
;;             (set (make-local-variable 'compile-command)
;;                  (concat "g++-4.9 -std=c++11 -Wall " buffer-file-name))))

;; ;; run html
;; (add-hook 'html-mode-hook
;;           (lambda ()
;;             (set (make-local-variable 'compile-command)
;;                  (concat "open " buffer-file-name))))

;; ;; run html
;; (add-hook 'web-mode-hook
;;           (lambda ()
;;             (set (make-local-variable 'compile-command)
;;                  (concat "open " buffer-file-name))))

;; Ctrl-K with no kill
(defun delete-line-no-kill ()
  (interactive)
  (delete-region
   (point)
   (save-excursion (move-end-of-line 1) (point)))
  (delete-char 1)
  )
(global-set-key (kbd "C-k") 'delete-line-no-kill)

(defun calc-eval-region (beg end)
  "Calculate the region and display the result in the echo area.
  With prefix ARG non-nil, insert the result at the end of region."
  (interactive "r")
  (let* ((expr (buffer-substring-no-properties beg end))
         (result (calc-eval expr)))
    
    (message "%s = %s" expr result)
    (goto-char end)
    (save-excursion
      (insert result))))
(global-set-key (kbd "C-c c") 'calc-eval-region)

;; ;; recompile
;; (global-set-key "\C-c\C-k" 'recompile)



(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; projectile mode -------------------------------------
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)
(setq projectile-enable-caching t)


;; helm ------------------------------------------------
(require 'helm)
(require 'helm-config)

;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t)

(helm-mode 1)
(helm-autoresize-mode t)

(global-set-key (kbd "C-x b") 'helm-mini)
;;(global-set-key (kbd "M-x") 'helm-M-x)

;; magit ------------------------------------------------
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)

(setq auto-window-vscroll nil)


(add-to-list 'load-path
             "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)

(setq yas-prompt-functions '(yas-completing-prompt))
;; yas-dropdown-prompt
;; yas-ido-prompt

;; personal selective display
(global-set-key (kbd "s-1") (lambda () (interactive) (set-selective-display 1)))
(global-set-key (kbd "s-2") (lambda () (interactive) (set-selective-display 3)))
(global-set-key (kbd "s-3") (lambda () (interactive) (set-selective-display 5)))
(global-set-key (kbd "s-4") (lambda () (interactive) (set-selective-display 7)))
(global-set-key (kbd "s-5") (lambda () (interactive) (set-selective-display 9)))
(global-set-key (kbd "s-6") (lambda () (interactive) (set-selective-display 11)))
(global-set-key (kbd "s-7") (lambda () (interactive) (set-selective-display 13)))
(global-set-key (kbd "s-8") (lambda () (interactive) (set-selective-display 15)))
(global-set-key (kbd "s-9") (lambda () (interactive) (set-selective-display 17)))
(global-set-key (kbd "s-0") 'set-selective-display)


(setq-default cursor-type 'bar)
(set-cursor-color "#ff2334")

;; (require 'fold-this)
;; (global-set-key (kbd "C-c C-q") 'fold-this)

(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

(setq sml/no-confirm-load-theme t)
(sml/setup)

(add-hook 'after-init-hook 'global-company-mode)

(define-key global-map (kbd "C-c C-c") 'company-complete)

(add-hook 'js2-mode-hook (lambda () (tern-mode t)))
;; (eval-after-load 'tern
;;    '(progn
;;       (require 'tern-auto-complete)
;;       (tern-ac-setup)))
;;(add-to-list 'company-backends 'company-tern)
(eval-after-load 'tern
  '(progn
     (add-to-list 'company-backends 'company-tern)))

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(setq system-uses-terminfo nil)

(window-numbering-mode t)

;;(delete-selection-mode nil)

(global-undo-tree-mode t)

(global-origami-mode t)

(global-set-key (kbd "C-c C-l") 'origami-toggle-node)

;; (global-set-key (kbd "C-c C-r") 'plantuml-render-buffer)

(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

(define-key global-map (kbd "C-c C-k") 'quickrun)
(define-key global-map (kbd "C-c C-q") 'quickrun-shell)

(quickrun-add-command "web"
                      '((:command . "open")
                        (:exec    .  "open %s")))

(autoload 'extempore-mode "~/.emacs.d/extempore.el" "" t)
(autoload 'extempore-repl "~/.emacs.d/extempore.el" "" t)
(add-to-list 'auto-mode-alist '("\\.xtm$" . extempore-mode))

(setq large-file-warning-threshold 200000000)

(setq org-todo-keyword-faces
      '(("DOING" . "blue") ("WAITING_REVIEW" . "yellow") ("MAYBE" . "pink")))

;; js2-refactor ---------------
(require 'js2-refactor)
(add-hook 'js2-mode-hook #'js2-refactor-mode)

(js2r-add-keybindings-with-prefix "C-c C-m")
;; eg. extract function with `C-c C-m ef`.


;;; JSX -----------------------

;;(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))
;; (defadvice web-mode-highlight-part (around tweak-jsx activate)
;;   (if (equal web-mode-content-type "jsx")
;;       (let ((web-mode-enable-part-face nil))
;;         ad-do-it)
;;     ad-do-it))

;; (require 'flycheck)
;; (flycheck-define-checker jsxhint-checker
;;   "A JSX syntax and style checker based on JSXHint."

;;   :command ("jsxhint" source)
;;   :error-patterns
;;   ((error line-start (1+ nonl) ": line " line ", col " column ", " (message) line-end))
;;   :modes (web-mode))
;; (add-hook 'web-mode-hook
;;           (lambda ()
;;             (when (equal web-mode-content-type "jsx")
;;               ;; enable flycheck
;;               (flycheck-select-checker 'jsxhint-checker)
;;               (flycheck-mode))))

;; JSX ------------------------------------

;; use web-mode for .jsx files
(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))

;; http://www.flycheck.org/manual/latest/index.html
(require 'flycheck)

;; turn on flychecking globally
;;(add-hook 'after-init-hook #'global-flycheck-mode)

;; (add-hook 'web-mode-hook
;;           (lambda ()
;;             (when (equal web-mode-content-type "jsx")
;;               ;; enable flycheck
;;               (flycheck-select-checker 'javascript-eslint)
;;               (flycheck-mode)
;;               (tern-mode t))))

(flycheck-add-mode 'javascript-eslint 'web-mode)

(defun myJSXHook ()
  "My Hook for JSX Files"
  (interactive)
  (web-mode)
  (web-mode-set-content-type "jsx")
  (flycheck-select-checker 'javascript-eslint)
  (flycheck-mode)
  (tern-mode t))

(global-set-key (kbd "C-c j") 'myJSXHook)

;; disable jshint since we prefer eslint checking
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(javascript-jshint)))

;; use eslint with web-mode for jsx files
;;(flycheck-add-mode 'javascript-eslint 'web-mode)

;; disable json-jsonlist checking for json files
;; (setq-default flycheck-disabled-checkers
;;   (append flycheck-disabled-checkers
;;     '(json-jsonlist)))

;;(add-hook 'jsx-mode-hook (lambda () (tern-mode t)))


;; helm swoop ------------------
(require 'helm-swoop)
(setq helm-swoop-pre-input-function
      (lambda () ""))

;; Change the keybinds to whatever you like :)
(global-set-key (kbd "M-i") 'helm-swoop)
(global-set-key (kbd "M-I") 'helm-swoop-back-to-last-point)
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

;; aggressive-indent-global-mode ------------------
;; (global-aggressive-indent-mode nil)
;; (add-to-list 'aggressive-indent-excluded-modes 'web-mode)


;;--------------------------------------------------------------------------------------------------------------------------
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-dabbrev-downcase nil)
 '(compilation-message-face (quote default))
 '(css-indent-offset 2)
 '(fci-rule-color "#49483E")
 '(helm-autoresize-max-height 35)
 '(helm-autoresize-min-height 35)
 '(helm-autoresize-mode t)
 '(helm-default-external-file-browser "open")
 '(helm-external-programs-associations
   (quote
    (("epub" . "open")
     ("pdf" . "open")
     ("mobi" . "open"))))
 '(highlight-changes-colors ("#FD5FF0" "#AE81FF"))
 '(highlight-indentation-offset 2)
 '(highlight-tail-colors
   (quote
    (("#49483E" . 0)
     ("#67930F" . 20)
     ("#349B8D" . 30)
     ("#21889B" . 50)
     ("#968B26" . 60)
     ("#A45E0A" . 70)
     ("#A41F99" . 85)
     ("#49483E" . 100))))
 '(js2-basic-offset 2)
 '(js2-strict-inconsistent-return-warning nil)
 '(magit-diff-use-overlays nil)
 '(projectile-mode-line (quote (:eval (format " prjctl"))))
 '(quickrun-focus-p t)
 '(session-use-package t nil (session))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#F92672")
     (40 . "#CF4F1F")
     (60 . "#C26C0F")
     (80 . "#E6DB74")
     (100 . "#AB8C00")
     (120 . "#A18F00")
     (140 . "#989200")
     (160 . "#8E9500")
     (180 . "#A6E22E")
     (200 . "#729A1E")
     (220 . "#609C3C")
     (240 . "#4E9D5B")
     (260 . "#3C9F79")
     (280 . "#A1EFE4")
     (300 . "#299BA6")
     (320 . "#2896B5")
     (340 . "#2790C3")
     (360 . "#66D9EF"))))
 '(vc-annotate-very-old-color nil)
 '(web-mode-auto-close-style 2)
 '(web-mode-code-indent-offset 2)
 '(web-mode-css-indent-offset 2)
 '(web-mode-enable-auto-quoting nil)
 '(web-mode-enable-current-element-highlight t)
 '(web-mode-markup-indent-offset 2)
 '(web-mode-sql-indent-offset 2)
 '(weechat-color-list
   (unspecified "#272822" "#49483E" "#A20C41" "#F92672" "#67930F" "#A6E22E" "#968B26" "#E6DB74" "#21889B" "#66D9EF" "#A41F99" "#FD5FF0" "#349B8D" "#A1EFE4" "#F8F8F2" "#F8F8F0")))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(web-mode-current-element-highlight-face ((t (:background "light green" :foreground "black")))))
