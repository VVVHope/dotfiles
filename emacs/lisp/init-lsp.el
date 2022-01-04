;;; init-lsp.el -*- coding: utf-8; lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package lsp-mode
  :hook ((lsp-mode . (lambda ()
                       (lsp-enable-which-key-integration)
                       (add-hook 'before-save-hook #'lsp-organize-imports t t)
                       (add-hook 'before-save-hook #'lsp-format-buffer t t)))
         (prog-mode . (lambda() (unless (derived-mode-p 'emacs-lisp-mode 'lisp-mode 'graphviz-dot-mode)(lsp-deferred)))))
  :commands (lsp lsp-deferred lsp-format-buffer lsp-organize-imports)
  :config (setq lsp-keymap-prefix "C-t l")
          (setq lsp-keep-workspace-alive nil ;; Auto kill LSP server
                lsp-enable-indentation nil
                lsp-enable-on-type-formatting t
                lsp-auto-guess-root t
                lsp-enable-snippet t
                lsp-prefer-flymake nil
                lsp-prefer-capf t
                lsp-modeline-diagnostics-enable t
                lsp-modeline-diagnostics-scope :workspace ;; workspace/global/file
                lsp-idle-delay 0.500
                read-process-output-max (* 1024 1024) ;; 1MB
                lsp-completion-provider :capf))

;;; Optionally: lsp-ui, company-lsp
(use-package lsp-ui
  :after lsp-mode
  :commands lsp-ui-mode
  :hook ((lsp-mode . lsp-ui-mode)
         (lsp-ui-mode . lsp-modeline-code-actions-mode)
         ;; (lsp-ui-mode . lsp-ui-peek-mode) ;; drop it 'cause it has BUGs
         )
  :config (setq lsp-ui-doc-enable t
              lsp-ui-doc-use-webkit nil
              lsp-ui-doc-delay .3
              lsp-ui-doc-include-signature t
			  lsp-lens-enable t
              lsp-ui-doc-position 'at-point ;; top/bottom/at-point
              lsp-eldoc-enable-hover t ;; eldoc displays in minibuffer
              lsp-ui-sideline-enable nil
              lsp-ui-sideline-show-hover nil
              lsp-ui-sideline-show-code-actions t
              lsp-ui-sideline-show-diagnostics t
              lsp-ui-sideline-ignore-duplicate t
              lsp-modeline-code-actions-segments '(count name)
              lsp-headerline-breadcrumb-enable nil)
  (setq lsp-ui-flycheck-enable t)
  (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
  (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references))

(use-package lsp-treemacs
  :commands lsp-treemacs-errors-list
  :config
  (when (display-graphic-p)
    (treemacs-resize-icons 14)))

(use-package dap-mode
  :diminish
  :hook ((lsp-mode . dap-mode)
         (dap-mode . dap-ui-mode)
	     (dap-mode . dap-tooltip-mode)
         (python-mode . (lambda() (require 'dap-python)))))


(provide 'init-lsp)

;;; init-lsp.el ends here