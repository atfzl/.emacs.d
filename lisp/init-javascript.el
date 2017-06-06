;;; Commentary:
;; Javascript file configurations

;;; Code:

;; (require 'company)
(require 'quickrun)
(require 'web-mode)
(require 'flycheck)

;; flow auto complete
;; (eval-after-load 'company
;;  '(add-to-list 'company-backends 'company-flow))

;; quickrun
;; (quickrun-add-command "babel"
;;                       '((:command . "babel-node")
;;                         (:exec    . "%c %s")))

;; (quickrun-set-default "javascript" "babel")

;; add eslint and flow checkers to flycheck
(flycheck-add-mode 'javascript-eslint 'web-mode)

;;disable jshint since we prefer eslint checking
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(javascript-jshint)))

(defun jsWithEslint ()
  "eslint for js files"
  (interactive)
  (web-mode)
  (web-mode-set-content-type "jsx")
  (flycheck-select-checker 'javascript-eslint)
  (flycheck-mode))

(global-set-key (kbd "C-c j") 'jsWithEslint)

(add-to-list 'auto-mode-alist '("\\.js\\'"      . jsWithEslint))
(add-to-list 'auto-mode-alist '("\\.jsx\\'"      . jsWithEslint))

(defadvice web-mode-highlight-part (around tweak-jsx activate)
  (if (equal web-mode-content-type "jsx")
    (let ((web-mode-enable-part-face nil))
      ad-do-it)
    ad-do-it))

(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq web-mode-attr-indent-offset 2)

(eval-after-load 'web-mode
  '(add-hook 'web-mode-hook #'add-node-modules-path))

(provide 'init-javascript)
;;; init-javascript.el ends here
