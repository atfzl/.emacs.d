;;; Commentary:
;; Javascript file configurations

;;; Code:

(require 'company)
(require 'quickrun)
(require 'web-mode)
(require 'js2-refactor)
(require 'flycheck)
(require 'flycheck-flow)

;; tern
(eval-after-load 'tern
  '(progn
     (add-to-list 'company-backends 'company-tern)))

;; quickrun
(quickrun-add-command "babel"
                      '((:command . "babel-node")
                        (:exec    . "%c %s")))

(quickrun-set-default "javascript" "babel")

;; js2-refactor
(add-hook 'js2-mode-hook #'js2-refactor-mode)

(js2r-add-keybindings-with-prefix "C-c C-m")

;; flycheck
(flycheck-add-mode 'javascript-eslint 'web-mode)
(flycheck-add-mode 'javascript-flow 'web-mode)

;;disable jshint since we prefer eslint checking
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(javascript-jshint)))

;; so that eslint points to the local eslint in ./node_modules/.bin
(setq flycheck-javascript-eslint-executable "eslint-project-relative")

(defun myJSXHook ()
  "My Hook for JSX Files."
  (interactive)
  (web-mode-set-content-type "jsx")
  (flycheck-select-checker 'javascript-eslint)
  (flycheck-mode)
  (tern-mode t))

(defun flowHook ()
  "Enable flow."
  (interactive)
  (web-mode-set-content-type "jsx")
  (flycheck-select-checker 'javascript-eslint)
  (flycheck-add-next-checker 'javascript-eslint 'javascript-flow)
  (flycheck-mode)
  (tern-mode t))

(global-set-key (kbd "C-c j") 'myJSXHook)
(global-set-key (kbd "C-c f") 'flowHook)

(add-to-list 'magic-mode-alist '("/* @flow */" . flowHook) )

(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq web-mode-attr-indent-offset 2)


(provide 'init-javascript)
;;; init-javascript.el ends here
