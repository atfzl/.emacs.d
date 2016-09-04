;;; Commentary:
;; Projectile configuration

;;; Code:

(require 'projectile)

(projectile-global-mode)
(setq projectile-enable-caching t)
(setq projectile-completion-system 'helm)


(provide 'init-projectile)
;;; init-projectile.el ends here
