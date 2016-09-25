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
    ("12670281275ea7c1b42d0a548a584e23b9c4e1d2dabb747fd5e2d692bcd0d39b" "93268bf5365f22c685550a3cbb8c687a1211e827edc76ce7be3c4bd764054bad" "840db7f67ce92c39deb38f38fbc5a990b8f89b0f47b77b96d98e4bf400ee590a" "34ed3e2fa4a1cb2ce7400c7f1a6c8f12931d8021435bad841fdc1192bd1cc7da" "78c1c89192e172436dbf892bd90562bc89e2cc3811b5f9506226e735a953a9c6" "5a7830712d709a4fc128a7998b7fa963f37e960fd2e8aa75c76f692b36e6cf3c" "b7e38c2b835e8b46cb51beb222ec85310a2b63135d4abbca44ecf533706fa6aa" "50e7f9d112e821e42bd2b8410d50de966c35c7434dec12ddea99cb05dd368dd8" "badc4f9ae3ee82a5ca711f3fd48c3f49ebe20e6303bba1912d4e2d19dd60ec98" "705f3f6154b4e8fac069849507fd8b660ece013b64a0a31846624ca18d6cf5e1" "b747fb36e99bc7f497248eafd6e32b45613ee086da74d1d92a8da59d37b9a829" default)))
 '(electric-pair-mode t)
 '(electric-pair-pairs (quote ((34 . 34) (39 . 39) (96 . 96))))
 '(fci-rule-color "#49483E")
 '(flycheck-javascript-flow-args nil)
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
 '(highlight-tail-colors (quote (("#F8BBD0" . 0) ("#FAFAFA" . 100))))
 '(js-indent-level 2)
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
 '(web-mode-attr-indent-offset 2)
 '(web-mode-auto-close-style 2)
 '(web-mode-auto-quote-style 1)
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
 )
