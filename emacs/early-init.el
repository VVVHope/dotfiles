;;; early-init.el -*- coding: utf-8; lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; Defer garbage collection further back in the startup process
(setq gc-cons-threshold most-positive-fixnum)
(add-hook 'after-init-hook (lambda () (setq gc-cons-threshold 800000)))

;; Prevent unwanted runtime compilation for native-comp users
(setq native-comp-deferred-compilation nil)

;; Package initialize occurs automatically, before `user-init-file' is
;; loaded, but after `early-init-file'. We handle package
;; initialization, so we must prevent Emacs from doing it early!
(setq package-enable-at-startup nil)
(setq load-prefer-newer t)

;; Inhibit resize frame at this stage.
(setq frame-inhibit-implied-resize t)

;; Disabled before initialized
(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)

;; Settings for system encoding
(set-language-environment 'utf-8)

;;; early-init.el ends here