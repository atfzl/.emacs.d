;;; init.el --- general
;;; Commentary:
;;; Some general Emacs window settings

;;(setq debug-on-error t)
;; basic --------------------------------------------
;;disable scroll bar and tool bar and menu bar
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(tooltip-mode nil)
(setq tooltip-use-echo-area t)
;; disable splash screen
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)

;; save how emacs looked in previous session
;;(desktop-save-mode 1)

;; disable alarms
(setq ring-bell-function 'ignore)

(setq make-backup-files nil)

(global-set-key (kbd "C-j") 'backward-delete-char-untabify)

(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(eval-after-load "org"
  '(require 'ox-md nil t))

;; server
(server-start)

;; tramp config
;;(setq tramp-default-method "ssh")

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

;;(require 'nvm)
;;(nvm-use "6.0.0")

;; show line numbers globally      
(global-linum-mode 1)

(add-hook 'kill-buffer-query-functions #'my/dont-kill-scratch)
(defun my/dont-kill-scratch ()
  (if (not (equal (buffer-name) "*scratch*"))
      t
    (message "Not allowed to kill %s, burying instead" (buffer-name))
    (bury-buffer)
    nil))

;; artist mode, use right click instead of middle click
(eval-after-load "artist"
  '(define-key artist-mode-map [(down-mouse-3)]
     'artist-mouse-choose-operation)
  )

(setq js-indent-level 2)

(setq-default js2-global-externs
              '("before" "describe" "after" "it" "debugger" "arguments"
                "angular" "module" "exports" "require" "setTimeout" "clearTimeout"
                "setInterval" "clearInterval" "console" "JSON" "process"
                "define" "__dirname"))

(add-to-list 'auto-mode-alist '("\\.js\\'"         . web-mode))
(add-to-list 'auto-mode-alist '("\\.es\\'"         . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'"       . web-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'"        . web-mode))
(add-to-list 'auto-mode-alist '("\\.rest\\'"       . restclient-mode))
(add-to-list 'auto-mode-alist '("\\.art\\'"        . artist-mode))
(add-to-list 'auto-mode-alist '("\\.zsh\\'"        . sh-mode))
(add-to-list 'auto-mode-alist '("\\.zsh-theme\\'"  . sh-mode))
(add-to-list 'auto-mode-alist '("\\.handlebars\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsx$"          . web-mode))

(add-hook 'scss-mode-hook 'rainbow-mode)
(add-hook 'css-mode-hook 'rainbow-mode)

;; open files by M-x
(defun gtd ()
  (interactive)
  (find-file "~/org/gtd.org")
  )

(defun todo ()
  (interactive)
  (find-file "~/org/todo.org")
  )

(defun imp ()
  (interactive)
  (find-file "~/org/imp.org")
  )

(defun projects ()
  (interactive)
  (find-file "~/org/projects.org")
  )

(defun init ()
  (interactive)
  (find-file "~/.emacs.d/init.el")
  )

(defun books ()
  (interactive)
  (find-file "~/org/books.org")
  )

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

;; refresh buffers automatically if changed by ext program
(global-auto-revert-mode 1)

(defalias 'yes-or-no-p 'y-or-n-p)

(setq dired-listing-switches "-alh")

;; load custom theme
;;(load-theme 'base16-monokai-dark t)
;;(load-theme 'apropospriate-light t)
;; (load-theme 'gruvbox t)

;; (load-theme 'silkworm t)

;; atom-one-dark
(load-theme 'atom-one-dark t)
(set-face-foreground 'linum "#5C6370")
;; atom-one-dark end

;; font
(set-frame-font "CamingoCode 14" nil t)
;;(set-default-font "Inconsolata 14")

;; (require 'spaceline-config)
;; (setq ns-use-srgb-colorspace nil)
;; (spaceline-spacemacs-theme)
;; (spaceline-toggle-buffer-size-off)
;; (spaceline-toggle-window-number-off)
;; (spaceline-toggle-hud-off)

;; Show the current function name in the header line
;; (which-function-mode)
;; (setq-default header-line-format
;;               '((which-func-mode ("" which-func-format " "))))
;; (setq mode-line-misc-info
;;             ;; We remove Which Function Mode from the mode line, because it's mostly
;;             ;; invisible here anyway.
;;             (assq-delete-all 'which-func-mode mode-line-misc-info))

(add-hook 'web-mode-hook #'smartparens-mode)

(global-whitespace-cleanup-mode)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((elasticsearch . t)))

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

;;(global-highlight-parentheses-mode 1)

;; electric pair mode
(electric-pair-mode 1)

;; Ctrl-K with no kill
(defun delete-line-no-kill ()
  (interactive)
  (delete-region
   (point)
   (save-excursion (move-end-of-line 1) (point)))
  (delete-char 1)
  )
(global-set-key (kbd "C-k") 'delete-line-no-kill)

;; (defun calc-eval-region (beg end)
;;   "Calculate the region and display the result in the echo area.
;;   With prefix ARG non-nil, insert the result at the end of region."
;;   (interactive "r")
;;   (let* ((expr (buffer-substring-no-properties beg end))
;;          (result (calc-eval expr)))
    
;;     (message "%s = %s" expr result)
;;     (goto-char end)
;;     (save-excursion
;;       (insert result))))
;; (global-set-key (kbd "C-c c") 'calc-eval-region)

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
(global-set-key (kbd "C-x C-f") 'helm-find-files)

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
(global-set-key (kbd "C-x C-b") 'helm-mini)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-c h x") 'helm-register)
;; magit ------------------------------------------------
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)

(setq auto-window-vscroll nil)

(add-to-list 'load-path
             "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)

(setq yas-prompt-functions '(yas-completing-prompt))

(setq-default cursor-type 'bar)
;;(set-cursor-color "#ff2334")

(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

(add-hook 'after-init-hook 'global-company-mode)

;;(define-key global-map (kbd "C-c C-c") 'company-complete)

(setq company-tooltip-limit 20)                      ; bigger popup window
;;(setq company-tooltip-align-annotations 't)          ; align annotations to the right tooltip border
(setq company-idle-delay .3)                         ; decrease delay before autocompletion popup shows
;;(setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing

(add-hook 'js2-mode-hook (lambda () (tern-mode t)))
(add-hook 'js2-mode-hook (lambda () (js2-imenu-extras-mode t)))

(eval-after-load 'tern
  '(progn
     (add-to-list 'company-backends 'company-tern)))

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(setq system-uses-terminfo nil)

(window-numbering-mode t)

;;(delete-selection-mode nil)

(global-set-key (kbd "RET") 'newline-and-indent)

(global-undo-tree-mode t)

(global-origami-mode t)

(global-set-key (kbd "C-c C-l") 'origami-toggle-node)

(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

(define-key global-map (kbd "C-c C-k") 'quickrun)
(define-key global-map (kbd "C-c C-q") 'quickrun-shell)

;; (quickrun-add-command "web"
;;                       '((:command . "open")
;;                         (:exec    .  "open %s")))

(require 'flycheck)
(add-hook 'c++-mode-hook (lambda () (setq flycheck-clang-language-standard "c++11")))


;; Add C++ command for C11 and set it default in C++ file.
(quickrun-add-command "c++/c11"
                      '((:command . "g++")
                        (:exec    . ("%c -std=c++11 %o -o %e %s"
                                     "%e %a"))
                        (:remove  . ("%e")))
                      :default "c++")

(quickrun-add-command "go"
                      '((:command . "go")
                        (:exec    .  "go run %s")))

(quickrun-add-command "babel"
                      '((:command . "babel-node")
                        (:exec    . "%c %s")))

(quickrun-set-default "javascript" "babel")

(autoload 'extempore-mode "~/.emacs.d/extempore.el" "" t)
(autoload 'extempore-repl "~/.emacs.d/extempore.el" "" t)
(add-to-list 'auto-mode-alist '("\\.xtm$" . extempore-mode))

;; (setq large-file-warning-threshold 200000000)

(setq org-todo-keyword-faces
      '(("DOING" . "blue") ("WAITING_REVIEW" . "yellow") ("MAYBE" . "pink")))

;; js2-refactor ---------------
(require 'js2-refactor)
(add-hook 'js2-mode-hook #'js2-refactor-mode)

(js2r-add-keybindings-with-prefix "C-c C-m")
;; eg. extract function with `C-c C-m ef`.


;; JSX ------------------------------------

;; http://www.flycheck.org/manual/latest/index.html
(flycheck-add-mode 'javascript-eslint 'web-mode)

(require 'flycheck-flow)
(flycheck-add-mode 'javascript-flow 'web-mode)

;; (eval-after-load 'flycheck
;;    '(flycheck-add-mode 'html-tidy 'web-mode))

(global-flycheck-mode 1)

;;disable jshint since we prefer eslint checking
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(javascript-jshint)))

(defun myJSXHook ()
  "My Hook for JSX Files"
  (interactive)
  (web-mode-set-content-type "jsx")
  (flycheck-select-checker 'javascript-eslint)
  (flycheck-mode)
  (tern-mode t))

;; (setq web-mode-content-types-alist
;;   '(("jsx" . "\\.js[x]?\\'")))

(setq flycheck-javascript-eslint-executable "eslint-project-relative")

;;(add-to-list 'magic-mode-alist '("import " . myJSXHook) )

(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq web-mode-attr-indent-offset 2)

(defun flowHook ()
  "enable flow"
  (interactive)
  (web-mode-set-content-type "jsx")
  (flycheck-select-checker 'javascript-eslint)
  (flycheck-add-next-checker 'javascript-eslint 'javascript-flow)
  (flycheck-mode)
  (tern-mode t))

(global-set-key (kbd "C-c j") 'myJSXHook)
(global-set-key (kbd "C-c f") 'flowHook)

;; (add-hook 'web-mode-hook 'myJSXHook)

(require 'org)
(require 'ob)

;; make org mode allow eval of some langs
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (js . t)))

;; stop emacs asking for confirmation
(setq org-confirm-babel-evaluate nil)
(setq org-src-fontify-natively t)

(setenv "NODE_PATH"
  (concat
   (getenv "HOME") "/scratch/presentations/node_modules"  ":"
   (getenv "NODE_PATH")
  )
)

;; helm swoop ------------------
(require 'helm-swoop)
;; (setq helm-swoop-pre-input-function
;;       (lambda () ""))

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

;;--------------------------------------------------------------------------------------------------------------------------
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(beacon-color "#F8BBD0")
 '(company-dabbrev-downcase nil)
 '(company-minimum-prefix-length 1)
 '(compilation-message-face (quote default))
 '(css-indent-offset 2)
 '(custom-safe-themes
   (quote
    ("5a7830712d709a4fc128a7998b7fa963f37e960fd2e8aa75c76f692b36e6cf3c" "b7e38c2b835e8b46cb51beb222ec85310a2b63135d4abbca44ecf533706fa6aa" "50e7f9d112e821e42bd2b8410d50de966c35c7434dec12ddea99cb05dd368dd8" "badc4f9ae3ee82a5ca711f3fd48c3f49ebe20e6303bba1912d4e2d19dd60ec98" "705f3f6154b4e8fac069849507fd8b660ece013b64a0a31846624ca18d6cf5e1" "b747fb36e99bc7f497248eafd6e32b45613ee086da74d1d92a8da59d37b9a829" default)))
 '(evil-emacs-state-cursor (quote ("#D50000" bar)))
 '(evil-insert-state-cursor (quote ("#D50000" hbar)))
 '(evil-normal-state-cursor (quote ("#F57F17" box)))
 '(evil-visual-state-cursor (quote ("#66BB6A" box)))
 '(fci-rule-color "#49483E")
 '(global-linum-mode t)
 '(grep-find-ignored-directories
   (quote
    ("SCCS" "RCS" "CVS" "MCVS" ".svn" ".git" ".hg" ".bzr" "_MTN" "_darcs" "{arch}" "bower_components" "node_modules")))
 '(helm-ag-use-grep-ignore-list t)
 '(helm-autoresize-max-height 35)
 '(helm-autoresize-min-height 35)
 '(helm-autoresize-mode t)
 '(helm-default-external-file-browser "open")
 '(helm-external-programs-associations
   (quote
    (("epub" . "open")
     ("pdf" . "open")
     ("mobi" . "open"))))
 '(helm-ff-file-name-history-use-recentf t)
 '(helm-ff-search-library-in-sexp t)
 '(helm-mode t)
 '(helm-move-to-line-cycle-in-source nil)
 '(helm-net-prefer-curl t)
 '(helm-scroll-amount 8)
 '(helm-split-window-in-side-p t)
 '(highlight-changes-colors ("#FD5FF0" "#AE81FF"))
 '(highlight-indentation-offset 2)
 '(highlight-symbol-colors
   (quote
    ("#F57F17" "#66BB6A" "#0097A7" "#42A5F5" "#7E57C2" "#D84315")))
 '(highlight-symbol-foreground-color "#546E7A")
 '(highlight-tail-colors (quote (("#F8BBD0" . 0) ("#FAFAFA" . 100))))
 '(js2-basic-offset 2)
 '(magit-diff-use-overlays nil)
 '(nginx-indent-level 2)
 '(org-src-lang-modes
   (quote
    (("ocaml" . tuareg)
     ("elisp" . emacs-lisp)
     ("ditaa" . artist)
     ("asymptote" . asy)
     ("dot" . fundamental)
     ("sqlite" . sql)
     ("calc" . fundamental)
     ("C" . c)
     ("cpp" . c++)
     ("C++" . c++)
     ("screen" . shell-script)
     ("shell" . sh)
     ("bash" . sh)
     ("js" . web))))
 '(pos-tip-background-color "#ffffff")
 '(pos-tip-foreground-color "#78909C")
 '(projectile-mode-line " prjctl")
 '(quickrun-focus-p t)
 '(safe-local-variable-values
   (quote
    ((eval progn
           (add-to-list
            (quote exec-path)
            (concat
             (locate-dominating-file default-directory ".dir-locals.el")
             "node_modules/.bin/")))
     (checkdoc-minor-mode . t)
     (mangle-whitespace . t))))
 '(session-use-package t nil (session))
 '(show-paren-mode t)
 '(tabbar-background-color "#ffffff")
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
 '(web-mode-attr-indent-offset 2 t)
 '(web-mode-auto-close-style 2)
 '(web-mode-code-indent-offset 2 t)
 '(web-mode-css-indent-offset 2 t)
 '(web-mode-enable-auto-quoting nil)
 '(web-mode-enable-current-element-highlight t)
 '(web-mode-markup-indent-offset 2 t)
 '(web-mode-sql-indent-offset 2)
 '(weechat-color-list
   (unspecified "#272822" "#49483E" "#A20C41" "#F92672" "#67930F" "#A6E22E" "#968B26" "#E6DB74" "#21889B" "#66D9EF" "#A41F99" "#FD5FF0" "#349B8D" "#A1EFE4" "#F8F8F2" "#F8F8F0")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(show-paren-match ((t (:underline t)))))
(put 'upcase-region 'disabled nil)
