;;; init-web.el -*- coding: utf-8; lexical-binding: t; -*-
;;; Commentary:
;;; Code:

; front-end
(use-package mmm-mode
  :config (setq mmm-global-mode 'buffers-with-submode-classes)
          (setq mmm-submode-decoration-level 2))

(provide 'init-web)

;;; init-web.el ends here