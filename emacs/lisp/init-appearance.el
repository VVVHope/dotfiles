;;; init-appearance.el -*- coding: utf-8; lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; GUI mode optimize
(defun optimize-ui ()
  "Insert a newline below the current line and put point at beginning."
  (set-frame-size (selected-frame) 180 56)
  (setq-default scroll-up-aggressively 0.01
                scroll-down-aggressively 0.01)
  (setq visible-bell 1
        redisplay-dont-pause t
        scroll-conservatively 100000
        scroll-margin 0
        scroll-step 1
        scroll-preserve-screen-position 'always)
  ;; default font
  (set-face-attribute 'default nil
                      :font "Fira Code")
  ;; Chinese characters
  (dolist (charset '(han cjk-misc chinese-gbk))
    (set-fontset-font "fontset-default" charset
                      (font-spec :family "WenQuanYi Micro Hei"))))

(when (display-graphic-p)
  (optimize-ui))

;; reload the fonts & screen layout when in Daemon mode
(add-hook 'after-make-frame-functions
          (lambda (frame)
            (select-frame frame)
            (when (display-graphic-p frame)
              (optimize-ui))))
			  
;; Don’t compact font caches during GC.
(setq inhibit-compacting-font-caches t)

;; insignificant things
(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)
(setq use-file-dialog nil
      use-dialog-box nil)
;; Set cursor-type
(setq-default cursor-type 'bar)
;; display line numbers
(global-display-line-numbers-mode t)
(setq display-line-numbers-width-start t)
(setq-default display-line-numbers-widen t)
;; display time
(display-time-mode 1) 
(setq display-time-24hr-format t
      display-time-day-and-date t) 

;; Basic modes
(save-place-mode 1)
(global-auto-revert-mode 1)
(column-number-mode 1)
(size-indication-mode t)
;; (display-battery-mode 1)
(setq ring-bell-function 'ignore)

;; colorize paired delimiters, optimized for dark theme
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode)
  :config (custom-set-faces
           '(rainbow-delimiters-depth-1-face ((t (:foreground "#ffffff"))))
           '(rainbow-delimiters-depth-2-face ((t (:foreground "#ff62d4"))))
           '(rainbow-delimiters-depth-3-face ((t (:foreground "#3fdfd0"))))
           '(rainbow-delimiters-depth-4-face ((t (:foreground "#fba849"))))
           '(rainbow-delimiters-depth-5-face ((t (:foreground "#9f80ff"))))
           '(rainbow-delimiters-depth-6-face ((t (:foreground "#4fe42f"))))
           '(rainbow-delimiters-depth-7-face ((t (:foreground "#fe6060"))))
           '(rainbow-delimiters-depth-8-face ((t (:foreground "#4fafff"))))))

;; display color
(use-package rainbow-mode
  :hook (prog-mode . rainbow-mode))

;; nyannyan
(use-package nyan-mode
  :hook (after-init . nyan-mode)
  :config (setq nyan-animate-nyancat t
                nyan-bar-length 17))

;; theme
;; (load-theme 'wombat t)
(use-package vscode-dark-plus-theme
  :ensure t
  :defer nil
  :config (load-theme 'vscode-dark-plus t))
(use-package solaire-mode
  :ensure t
  :config
  (solaire-global-mode +1))

(use-package all-the-icons-dired
  :diminish
  :hook (dired-mode . all-the-icons-dired-mode))

(use-package so-long
  :ensure nil
  :hook (after-init . global-so-long-mode)
  :config (setq so-long-threshold 400))

(provide 'init-appearance)

;;; init-appearance.el ends here