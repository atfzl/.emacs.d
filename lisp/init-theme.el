;;; Commentary:
;; Theme configuration

;;; Code:

;; theme
(load-theme 'base16-gruvbox-dark-hard t)

(set-face-attribute 'fringe nil :background "#1d2021")

;; line number font color background
(set-face-background 'linum "#1d2021")

;; font family and size
(set-frame-font "Camingocode 14" nil t)

;; show the cursor like this |
(setq-default cursor-type 'bar)

(provide 'init-theme)
;;; init-theme.el ends here
