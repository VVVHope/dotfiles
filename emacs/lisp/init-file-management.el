;;; init-file-management.el -*- coding: utf-8; lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require 'dired-x)
(use-package dired
  :ensure nil
  :bind (:map dired-mode-map
          ("i" . dired-previous-line)
		  ("k" . dired-next-line)
		  ("j" . dired-jump)
		  ("l" . dired-find-file)))
;; highlight uncommitted changes
(use-package diff-hl
  :hook (((prog-mode vc-dir-mode) . diff-hl-mode)
         (dired-mode . diff-hl-dired-mode)))
(use-package dired-hide-dotfiles
  :bind (:map dired-mode-map
          ("." . dired-hide-dotfiles-mode)))
;; Colourful dired
(use-package diredfl
  :init (diredfl-global-mode 1))

(setq dired-kill-when-opening-new-dired-buffer t)

(use-package treemacs
  :commands (treemacs-follow-mode
             treemacs-filewatch-mode
             treemacs-fringe-indicator-mode
             treemacs-git-mode)
  :bind (([f8]        . treemacs)
         ("M-0"       . treemacs-select-window)
         ("C-x 1"     . treemacs-delete-other-windows)
         ("C-x t 1"   . treemacs-delete-other-windows)
         ("C-x t t"   . treemacs)
         ("C-x t b"   . treemacs-bookmark)
         ("C-x t C-t" . treemacs-find-file)
         ("C-x t M-t" . treemacs-find-tag)
         :map treemacs-mode-map
         ([mouse-1]   . treemacs-single-click-expand-action)
		 ("i" . treemacs-previous-line)
		 ("k" . treemacs-next-line))
  :config
  (setq treemacs-collapse-dirs           (if treemacs-python-executable 3 0)
        treemacs-missing-project-action  'remove
        treemacs-sorting                 'alphabetic-asc
        treemacs-follow-after-init       t
        treemacs-width                   30)
  (treemacs-load-all-the-icons-with-workaround-font "Hermit")
  :config
  (treemacs-follow-mode t)
  (treemacs-filewatch-mode t)
  (pcase (cons (not (null (executable-find "git")))
               (not (null (executable-find "python3"))))
    (`(t . t)
     (treemacs-git-mode 'deferred))
    (`(t . _)
     (treemacs-git-mode 'simple)))

  (use-package treemacs-projectile
    :after projectile
    :bind (:map projectile-command-map
           ("h" . treemacs-projectile)))

  (use-package treemacs-magit
    :after magit
    :commands treemacs-magit--schedule-update
    :hook ((magit-post-commit
            git-commit-post-finish
            magit-post-stage
            magit-post-unstage)
           . treemacs-magit--schedule-update))

  (use-package treemacs-persp
    :after persp-mode
    :demand t
    :functions treemacs-set-scope-type
    :config (treemacs-set-scope-type 'Perspectives)))


(use-package treemacs-all-the-icons)

	
(provide 'init-file-management)

;;; init-file-management.el ends here