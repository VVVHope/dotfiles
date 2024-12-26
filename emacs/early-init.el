;;; early-init.el --- Early initialization run before init.el  -*- lexical-binding: t; -*-

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
;; Early initialization before the package system and GUI is initialized.
;; Customize variables that affect the package initialization process.
;;
;;; Code:

;; Defer garbage collection further back in the startup process
(setq gc-cons-threshold most-positive-fixnum)
(add-hook 'after-init-hook (lambda () (setq gc-cons-threshold 800000)))

;; Prevent unwanted runtime compilation for gccemacs (native-comp) users;
;; packages are compiled ahead-of-time when they are installed and site files
;; are compiled when gccemacs is installed.
(setq native-comp-deferred-compilation nil
      native-comp-jit-compilation nil)

;; Package initialize occurs automatically, before `user-init-file' is
;; loaded, but after `early-init-file'. We handle package
;; initialization, so we must prevent Emacs from doing it early!
(setq package-enable-at-startup nil)
(setq load-prefer-newer t)

;; Allows you to easily navigate to use-package (and require) blocks in your files.
;; It must be set before (require 'use-package).
(setq use-package-enable-imenu-support t)

;; Inhibit resize frame at this stage.
(setq frame-inhibit-implied-resize t)

;; Disabled before initialized
(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)

;; Prevent flashing of unstyled modeline at startup
(setq-default mode-line-format nil)

;; Settings for system encoding
(set-language-environment 'utf-8)

;;; early-init.el ends here