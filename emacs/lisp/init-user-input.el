;;; init-user-input.el -*- coding: utf-8; lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package multiple-cursors)

;; drag-stuff - move lines up/down
(use-package drag-stuff
  :bind (("<M-up>". drag-stuff-up)
         ("<M-down>" . drag-stuff-down)))

;; Unbind <C-i> from the TAB key and bind it to indent-region.
;; Since TAB and <C-i> cannot be differentiated in TTY emacs,
;; the workaround is to conditionally bind TAB to indent-region
;; when there is an active region selected.
(if (display-graphic-p)
  ; IF we are not in a TTY, unbind C-i from TAB
  (progn
    (define-key input-decode-map [?\C-i] [C-i])
    (global-set-key (kbd "<C-i>") 'previous-line)
    (define-key input-decode-map [?\C-m] [C-m])
    (global-set-key (kbd "<C-m>") 'previous-line))
  ; ELSE IF we are in a TTY, create a replacement for TAB
  (defun my/tab-replacement (&optional START END)
    (interactive "r")
    (if (use-region-p)
      ; IF active region, use indent-region
        (indent-region START END)
      ; ELSE IF no active region, use default tab command
      (indent-for-tab-command)))
  ; Bind our quick-and-dirty TAB replacement to the TAB key
  (global-set-key (kbd "TAB") 'my/tab-replacement))

;; insert a newline
(defun open-line-above ()
  "Insert a newline above the current line and put point at beginning."
  (interactive)
  (unless (bolp)
    (beginning-of-line))
  (newline)
  (forward-line -1)
  (indent-according-to-mode))
(defun open-line-below ()
  "Insert a newline below the current line and put point at beginning."
  (interactive)
  (unless (eolp)
    (end-of-line))
  (newline-and-indent))

;; (global-set-key (kbd "C-r") (lookup-key global-map (kbd "C-c")))

(bind-keys*
  ("M-i" . previous-line); move around
  ("C-j" . backward-char)
  ("M-j" . backward-word)
  ("C-k" . next-line)
  ("M-k" . next-line)
  ("C-l" . forward-char)
  ("M-l" . forward-word)
  ("M-u" . backward-sentence)
  ("M-o" . forward-sentence)
  ("C-a" . mwim-beginning-of-code-or-line)
  ("C-e" . mwim-end-of-code-or-line)
  ("<home>" . mwim-beginning-of-line-or-code)
  ("<end>" . mwim-end-of-line-or-code)
  ("M-I" . upcase-word); case convert
  ("M-K" . downcase-word)
  ("C-d" . kill-whole-line); kill/insert line
  ("M-d" . kill-line)
  ("C-n" . open-line-below)
  ("M-n" . open-line-above)
  ("M-w" . kill-sentence)
  ("C-c" . kill-ring-save); cut/copy/paste
  ("M-c" . kill-region)
  ("C-v" . yank)
  ("M-v" . yank-pop)
  ("C-z" . undo)
  ("C-w" . View-scroll-half-page-backward); scroll
  ("C-s" . View-scroll-half-page-forward)
  ("M-s" . recenter-top-bottom)
  ("C-f" . ctrlf-forward-default); packages
  ("M-f" . ctrlf-backward-default))

; universal-argument C-u
; TODO C/M-w C/M-y C-m
; prefix for git 
; C-/ (previously undo

;; create prefix
(define-prefix-command 'my-prefix-map)
(global-set-key (kbd "C-r") 'my-prefix-map)
(define-prefix-command 'my-combo-prefix-map)
(global-set-key (kbd "C-r C-v") 'my-combo-prefix-map)

(bind-keys :map prog-mode-map
           ("C-." . lsp-find-definition)
           ("C-," . pop-tag-mark))

;; global key-binding settings for comment
(global-set-key (kbd "C-x /") 'comment-line)
(global-set-key (kbd "C-x ?") 'comment-or-uncomment-region)

(use-package hideshow
  :bind (("C-x [". hs-hide-block)
         ("C-x ]" . hs-show-block)))

;; C-x w #num to change frame
(use-package winum
  :hook (after-init . winum-mode))

;; Display ugly ^L page breaks as tidy horizontal lines
(use-package page-break-lines
  :diminish
  :hook (after-init . global-page-break-lines-mode))

;; For Windows, make both Windows keys emit ‘super’
;; (may need a registry hack or use AutoHotKey to get rid of Windows’ interceptions)
(when (equal window-system 'w32)
  (setq
    w32-pass-lwindow-to-system nil
    w32-lwindow-modifier 'super
    w32-pass-rwindow-to-system nil
    w32-rwindow-modifier 'super
    w32-pass-apps-to-system nil
    w32-apps-modifier 'hyper
    w32-pass-alt-to-system nil
    w32-scroll-lock-modifier nil))

(provide 'init-user-input)

;;; init-user-input.el ends here