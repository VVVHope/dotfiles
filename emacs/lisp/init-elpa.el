;;; init-elpa.el -*- coding: utf-8; lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)

;;; Initialize the packages, avoiding a re-initialization
(unless (bound-and-true-p package--initialized) ;; To avoid warnings on 27
  (setq package-enable-at-startup nil)
  (package-initialize))

(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
  
(eval-when-compile
  (require 'use-package))

(setq use-package-always-ensure t
      use-package-always-defer t
	  use-package-always-demand nil
      use-package-expand-minimally t
      use-package-verbose t)

(use-package diminish)
(use-package bind-key)

;; package-update
(use-package auto-compile
  :config (auto-compile-on-load-mode))

(setq load-prefer-newer t)

(use-package auto-package-update
  :ensure t
  :config
  (setq auto-package-update-delete-old-versions t))

(provide 'init-elpa)

;;; init-elpa.el ends here