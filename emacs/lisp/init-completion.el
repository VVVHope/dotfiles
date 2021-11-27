;;; init-completion.el -*- coding: utf-8; lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;:bind :map company-active-map ("<tab>" . company-complete-common)
(use-package company
  :diminish company-mode
  :defines (company-dabbrev-ignore-case company-dabbrev-downcase)
  :hook (after-init . global-company-mode)
  :config (setq company-dabbrev-code-everywhere t
		        company-dabbrev-code-modes t
		        company-dabbrev-code-other-buffers 'all
		        company-dabbrev-downcase nil
		        company-dabbrev-ignore-case t
		        company-dabbrev-other-buffers 'all
		        company-require-match nil
		        company-minimum-prefix-length 1
		        company-show-numbers t
		        company-tooltip-limit 20
		        company-idle-delay 0
		        company-echo-delay 0
		        company-tooltip-offset-display 'scrollbar
		        company-begin-commands '(self-insert-command))
  (eval-after-load 'company
    '(add-to-list 'company-backends
                  '(company-abbrev company-yasnippet company-capf))))

;; add some semantic icons to the company completion menu
(use-package company-box
  :after company
  :diminish
  :hook (company-mode . company-box-mode))

;; Better sorting and filtering
(use-package company-prescient
  :init (company-prescient-mode 1))

;; snippet
(use-package yasnippet
  :diminish
  :hook (after-init . yas-global-mode)
  :config (setq yas-indent-line 'auto)
          (use-package yasnippet-snippets
            :after yasnippet
			:diminish)
          (use-package auto-yasnippet
		    :diminish
            :bind (("C-n" . aya-open-line)
                   ("H-w" . aya-create)
                   ("H-y" . aya-expand))))

(provide 'init-completion)

;;; init-completion.el ends here