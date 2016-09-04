;;; Commentary:
;; Theme configuration

;;; Code:

;; theme
(load-theme 'atom-one-dark t)

;; line number font color
(set-face-foreground 'linum "#5C6370")

;; font family and size
(set-frame-font "CamingoCode 14" nil t)

;; show the cursor like this |
(setq-default cursor-type 'bar)


(provide 'init-theme)
;;; init-theme.el ends here
