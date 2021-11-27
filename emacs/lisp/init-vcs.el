;;; init-vcs.el -*- coding: utf-8; lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package magit
  :bind ("C-x g" . magit-status)
  :config (use-package with-editor)
          ;(setq magit-push-always-verify nil)
          (setq git-commit-summary-max-length 50))

(use-package git-timemachine)

(provide 'init-vcs)

;;; init-vcs.el ends here