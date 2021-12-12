;;; init-editing.el -*- coding: utf-8; lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; highlight line with the cursor, preserving background colors.
(global-hl-line-mode 1)
(set-face-attribute 'hl-line nil :inherit nil :background "#171717")
;; abbreviation
(defalias 'yes-or-no-p 'y-or-n-p)
;; auto-saving
(auto-save-visited-mode 1)
(setq auto-save-default nil)
;; backup
(setq create-lockfiles nil)
(setq make-backup-files t)
(setq backup-directory-alist
      `(("." . ,(concat user-emacs-directory "backups"))))
;; parentheses
(setq blink-matching-paren t)
(setq-default show-paren-style 'mixed
              show-paren-when-point-inside-paren t
              show-paren-when-point-in-periphery t)
(show-paren-mode 1)
(electric-pair-mode 1)

(add-hook 'after-init-hook 'delete-selection-mode)
(setq sentence-end-double-space nil)
;; indent
(setq-default tab-width 4
              indent-tabs-mode nil)
(use-package highlight-indent-guides
  :ensure t
  :diminish
  :hook (prog-mode . highlight-indent-guides-mode)
  :config (setq highlight-indent-guides-method (if (display-graphic-p) 'bitmap 'column))
          (setq highlight-indent-guides-responsive 'top))

;; better jumping
(use-package mwim
  :ensure t
  :defer nil)
(use-package subword
  :config (global-subword-mode 1))
;; CamelCase symbols as separate words
(use-package subword
  :hook ((prog-mode minibuffer-setup) . subword-mode))
;; whitespace
(setq show-trailing-whitespace t)
;; cleanup whitespace only if it was initially clean
(use-package whitespace-cleanup-mode
  :diminish
  :hook (after-init . global-whitespace-cleanup-mode))

;; blink curser after jump
(use-package beacon
  :diminish
  :hook (after-init . beacon-mode)
  :config (setq beacon-color "#ff8c00"))

(use-package let-alist); easily let-bind values of an assoc-list by their names
(use-package flycheck
  :diminish
  :ensure t
  :init (global-flycheck-mode)
  :bind (:map flycheck-mode-map
              ("C-t ! C-c" . flycheck-compile)
              ("C-t ! C-w" . flycheck-copy-errors-as-kill)
              ("C-t ! ?" . flycheck-describe-checker)
              ("C-t ! C" . flycheck-clear)
              ("C-t ! H" . display-local-help)
              ("C-t ! V" . flycheck-version)
              ("C-t ! c" . flycheck-buffer)
              ("C-t ! e" . flycheck-explain-error-at-point)
              ("C-t ! h" . flycheck-display-error-at-point)
              ("C-t ! i" . flycheck-manual)
              ("C-t ! l" . flycheck-list-errors)
              ("C-t ! n" . flycheck-next-error)
              ("C-t ! p" . flycheck-previous-error)
              ("C-t ! s" . flycheck-select-checker)
              ("C-t ! v" . flycheck-verify-setup)
              ("C-t ! x" . flycheck-disable-checker)))

;; for scroll-half-page
(require 'view)

;; smooth scrolling over images
(use-package iscroll
  :diminish
  :hook (image-mode . iscroll-mode))

(provide 'init-editing)

;;; init-editing.el ends here
