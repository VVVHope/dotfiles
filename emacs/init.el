;;; init.el -*- coding: utf-8; lexical-binding: t; -*-
;;; Commentary: A Essential Emacs Configuration.
;;; Code:

;; Remove this to run with early version
(let ((minver "27.2"))
  (when (version< emacs-version minver)
    (error "Emacs v%s or higher recommended" minver)))

;; Deal with custom.el
(add-to-list 'load-path (expand-file-name (concat user-emacs-directory "lisp")))
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(require 'init-elpa)
(require 'init-appearance)
(require 'init-modeline)
(require 'init-editing)
(require 'init-tabbar)
(require 'init-minibuffer)
(require 'init-completion)
(require 'init-file-management)
(require 'init-projectile)
(require 'init-org)
(require 'init-vcs)

(require 'init-lsp)
(require 'init-languages)
(require 'init-web)

;; Keymap
(require 'init-user-input)

(when (file-exists-p custom-file)
  (load-file custom-file))

;; Settings for system encoding
(prefer-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
(set-file-name-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)

(setq default-directory "~/projects/")
(setq initial-major-mode 'org-mode)

;; Greeting
(defun display-startup-echo-area-message ()
  (message "Hello?"))

;;; init.el ends here