;;; init-modeline.el -*- coding: utf-8; lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package doom-modeline
  :defer nil
  :config (doom-modeline-mode 1)
          (setq doom-modeline-height 19)
          (setq doom-modeline-bar-width 4)
          (setq doom-modeline-buffer-file-name-style 'auto)
          (setq doom-modeline-icon (display-graphic-p))
          (setq doom-modeline-major-mode-icon t)
          (setq doom-modeline-major-mode-color-icon t)
          (setq doom-modeline-buffer-state-icon t)
          (setq doom-modeline-buffer-modification-icon t)
          (setq doom-modeline-unicode-fallback nil)
          (setq doom-modeline-minor-modes nil)
          (setq doom-modeline-enable-word-count nil)
          (setq doom-modeline-buffer-encoding t)
          (setq doom-modeline-indent-info nil)
          (setq doom-modeline-checker-simple-format t)
          (setq doom-modeline-number-limit 99)
          (setq doom-modeline-vcs-max-length 12)
          (setq doom-modeline-workspace-name t)
          (setq doom-modeline-persp-name t)
          (setq doom-modeline-display-default-persp-name nil)
          (setq doom-modeline-persp-icon t)
          (setq doom-modeline-lsp t)
          ;; Whether display the modal state icon.
          ;; Including `evil', `overwrite', `god', `ryo' and `xah-fly-keys', etc.
          (setq doom-modeline-modal-icon t)
          ;; Whether display the mu4e notifications. It requires `mu4e-alert' package.
          (setq doom-modeline-mu4e nil)
          ;; also enable the start of mu4e-alert
          ;; (mu4e-alert-enable-mode-line-display)
          ;; Whether display the gnus notifications.
          (setq doom-modeline-gnus t)
          ;; Wheter gnus should automatically be updated and how often (set to 0 or smaller than 0 to disable)
          (setq doom-modeline-gnus-timer 2)
          ;; Wheter groups should be excludede when gnus automatically being updated.
          (setq doom-modeline-gnus-excluded-groups '("dummy.group"))
          ;; Whether display the IRC notifications. It requires `circe' or `erc' package.
          (setq doom-modeline-irc t)
          ;; Function to stylize the irc buffer names.
          (setq doom-modeline-irc-stylize 'identity)
          ;; Whether display the environment version.
          (setq doom-modeline-env-version t)
          ;; Or for individual languages
          (setq doom-modeline-env-enable-python t)
          (setq doom-modeline-env-enable-ruby t)
          (setq doom-modeline-env-enable-perl t)
          (setq doom-modeline-env-enable-go t)
          (setq doom-modeline-env-enable-elixir t)
          (setq doom-modeline-env-enable-rust t)
          ;; Change the executables to use for the language version string
          (setq doom-modeline-env-python-executable "python") ; or `python-shell-interpreter'
          (setq doom-modeline-env-ruby-executable "ruby")
          (setq doom-modeline-env-perl-executable "perl")
          (setq doom-modeline-env-go-executable "go")
          (setq doom-modeline-env-elixir-executable "iex")
          (setq doom-modeline-env-rust-executable "rustc")
          ;; What to display as the version while a new one is being loaded
          (setq doom-modeline-env-load-string "...")
          ;; Hooks that run before/after the modeline version string is updated
          (setq doom-modeline-before-update-env-hook nil)
          (setq doom-modeline-after-update-env-hook nil))

(provide 'init-modeline)

;;; init-modeline.el ends here