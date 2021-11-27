;;; init-minibuffer.el -*- coding: utf-8; lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; minibuffer
(fido-mode 1)
(setq completion-styles '(initials partial-completion flex))
(setq completion-cycle-threshold 10)
(use-package icomplete-vertical
  :defer nil
  :hook (after-init . icomplete-vertical-mode))

(use-package ctrlf
  :hook (after-init . ctrlf-mode))

(use-package which-key
  :defer nil
  :config (which-key-mode))

(provide 'init-minibuffer)

;;; init-minibuffer.el ends here