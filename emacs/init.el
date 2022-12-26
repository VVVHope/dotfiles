;;; init.el -*- coding: utf-8; lexical-binding: t; -*-
;;; Commentary: A Essential Emacs Configuration.
;;; Code:

;; Remove this to run with early version
(let ((minver "28.1"))
  (when (version< emacs-version minver)
    (error "Emacs v%s or higher recommended" minver)))

;; custom.el
(add-to-list 'load-path (expand-file-name (concat user-emacs-directory "lisp")))
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;;; Initialize the packages, avoiding a re-initialization
(unless (bound-and-true-p package--initialized) ;; To avoid warnings on 27
  (setq package-enable-at-startup nil)
  (package-initialize))

(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(org-babel-load-file "~/.config/emacs/configuration.org")

(when (file-exists-p custom-file)
  (load-file custom-file))

(setq default-directory "~/projects/")
(setq initial-major-mode 'org-mode)

;; Greeting
(defun display-startup-echo-area-message ()
  (message "Hello?"))

;;; init.el ends here