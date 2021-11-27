;;; init-projectile.el -*- coding: utf-8; lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package ag)

(use-package projectile
  :diminish projectile-mode
  :hook (after-init . projectile-mode)
  :bind(:map projectile-mode-map
             ("C-p" . projectile-command-map))
  :config
    ;; move cache to ~/.emacs.d/.cache/ for gitignore
    (setq projectile-cache-file (expand-file-name ".cache/projectile.cache" user-emacs-directory)))

(provide 'init-projectile)

;;; init-projectile.el ends here