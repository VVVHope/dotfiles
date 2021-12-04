;;; init-tabbar.el -*- coding: utf-8; lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package centaur-tabs
  :demand
  :hook (dired-mode . centaur-tabs-local-mode)
  :config (centaur-tabs-mode t)
          (centaur-tabs-headline-match)
          (setq centaur-tabs-height 10
		        centaur-tabs-set-icons t
                centaur-tabs-plain-icons nil
                centaur-tabs-gray-out-icons 'buffer
                centaur-tabs-set-bar 'left
				centaur-tabs-set-close-button nil
                centaur-tabs-set-modified-marker t)
  :bind (:map centaur-tabs-mode-map
          ("C-t u" . centaur-tabs-backward)
          ("C-t o" . centaur-tabs-forward)))

(provide 'init-tabbar)

;;; init-tabbar.el ends here