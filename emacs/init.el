;;; init.el --- Specifies how to initialize Emacs  -*- lexical-binding: t; -*-

;; Copyright (C) 2021-2025 viayulo

;; Author: viayulo <vvvhope45@gmail.com>
;; URL: https://github.com/viayulo/dotfiles/tree/main/emacs

;; This file is not part of GNU Emacs.

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; An essential Emacs configuration, with a unorthodox key binding of ijkl(directional) and Windows-like shortcut.
;; Load main configuration file configuration.org.
;;
;;; Code:

;; Minimum Version of Emacs compatible with this configuration
(let ((minver "29.1"))
  (when (version< emacs-version minver)
    (error "Emacs v%s or higher recommended" minver)))

;; custom.el
(add-to-list 'load-path (expand-file-name (concat user-emacs-directory "lisp")))
(setq custom-file (locate-user-emacs-file "custom.el"))

;; To use the MELPA repository
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; Initialize the packages, avoiding a re-initialization
(unless (bound-and-true-p package--initialized) ;; To avoid warnings on 27
  (setq package-enable-at-startup nil)
  (package-initialize))

(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Prefer the newest commit over the latest release by default for :vc
(setq use-package-vc-prefer-newest t)

;; Load the main configuration file.
(setq org-configuration-file (locate-user-emacs-file "configuration.org"))
(when (file-exists-p org-configuration-file)
  (org-babel-load-file org-configuration-file))

(when (file-directory-p "~/projects/")
  (setq default-directory "~/projects/"))
(setq initial-major-mode 'org-mode)

(when (file-exists-p custom-file)
  (load-file custom-file))

;; Greeting
(defun display-startup-echo-area-message ()
  (message "Hello?"))

;;; init.el ends here