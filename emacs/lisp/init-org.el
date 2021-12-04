;;; init-org.el -*- coding: utf-8; lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package org 
  :ensure org-plus-contrib 
  :hook (org-mode . visual-line-mode)
        (org-mode . org-indent-mode)
  :config (setq org-log-done 'time)
          (setq org-todo-keywords '((sequence "TODO(t)" "WAIT(w@/!)" "|" "DONE(d!)" "CANCELED(c@)")))
		  (setq org-startup-indented t
                org-hide-emphasis-markers t
                org-pretty-entities t)
          ;; Show linked images directly in my Org document
          (setq org-startup-with-inline-images t org-image-actual-width '(600))
          ;; Use syntax highlighting in source blocks while editing.
          (setq org-src-fontify-natively t)
          ;; Make TAB act as if it were issued in a buffer of the language’s major mode.
          (setq org-src-tab-acts-natively t)
          ;; When editing a code snippet, use the current window rather than popping open a new one (which shows the same information).
          (setq org-src-window-setup 'current-window)
  :bind (:map org-mode-map
              ("C-t C-a" . org-attach) 
              ("C-t C-j" . org-backward-heading-same-level) 
              ("C-t C-t" . org-ctrl-c-ctrl-c) 
              ("C-t C-d" . org-deadline) 
              ("C-t C-e" . org-export-dispatch) 
              ("C-t C-l" . org-forward-heading-same-level) 
              ("C-t j" . org-goto) 
              ("C-t k" . org-kill-note-or-show-branches) 
              ("C-t l" . org-insert-link) 
              ("C-t C-o" . org-open-at-point) 
              ("C-t C-q" . org-set-tags-command) 
              ("C-t r" . org-reveal) 
              ("C-t C-s" . org-schedule) 
              ("C-t t" . org-todo) 
              ("C-t C-w" . org-refile) 
              ("C-t y" . org-evaluate-time-range) 
              ("C-t C-z" . org-add-note) 
              ("C-t C-^" . org-up-element) 
              ("C-t C-_" . org-down-element) 
              ("C-t C-*" . org-list-make-subtree) 
              ("C-t C-," . org-insert-structure-template) 
              ("C-t C-k" . outline-next-visible-heading) ;
              ("C-t C-i" . outline-previous-visible-heading) ;
              ("C-t C-u" . outline-up-heading) 
              ("C-t C-<" . outline-promote) 
              ("C-t C->" . outline-demote) 
              ("C-t M-j" . org-previous-block) 
              ("C-t M-l" . org-next-block) 
              ("C-t M-i" . org-insert-last-stored-link) 
              ("C-t C-c" . org-refile-copy) 
              ("C-t C-M-l" . org-insert-all-links) 
              ("C-t C-TAB" . org-force-cycle-archived) 
              ("C-t TAB" . org-ctrl-c-tab) 
              ("C-t SPC" . org-table-blank-field) 
              ("C-t RET" . org-ctrl-c-ret) 
              ("C-t a" . org-agenda) 
              ("C-t #" . org-update-statistics-cookies) 
              ("C-t $" . org-archive-subtree) 
              ("C-t %" . org-mark-ring-push) 
              ("C-t '" . org-edit-special) 
              ("C-t *" . org-ctrl-c-star) 
              ("C-t +" . org-table-sum) 
              ("C-t ," . org-priority) 
              ("C-t -" . org-ctrl-c-minus) 
              ("C-t ." . org-time-stamp) 
              ("C-t /" . org-sparse-tree) 
              ("C-t \;" . org-toggle-comment) 
              ("C-t <" . org-date-from-calendar) 
              ("C-t =" . org-table-eval-formula) 
              ("C-t >" . org-goto-calendar) 
              ("C-t ?" . org-table-field-info) 
              ("C-t @" . org-mark-subtree) 
              ("C-t [" . org-agenda-file-to-front) 
              ("C-t \\" . org-match-sparse-tree) 
              ("C-t \]" . org-remove-file) 
              ("C-t ^" . org-sort) 
              ("C-t `" . org-table-edit-field) 
              ("C-t {" . org-table-toggle-formula-debugger) 
              ("C-t |" . org-table-create-or-convert-from-region) 
              ("C-t }" . org-table-toggle-coordinate-overlays) 
              ("C-t ~" . org-table-create-with-table.el) 
              ("C-t C-y C-a" . org-babel-sha1-hash) 
              ("C-t C-y C-j" . org-babel-execute-buffer) 
              ("C-t C-y C-c" . org-babel-check-src-block) 
              ("C-t C-y C-d" . org-babel-demarcate-block) 
              ("C-t C-y C-e" . org-babel-execute-maybe) 
              ("C-t C-y C-l" . org-babel-tangle-file) 
              ("C-t C-y TAB" . org-babel-view-src-block-info) 
              ;("C-t C-y C-j" . org-babel-insert-header-arg) 
              ;("C-t C-y C-l" . org-babel-load-in-session) 
              ("C-t C-y C-k" . org-babel-next-src-block) 
              ("C-t C-y C-o" . org-babel-open-src-block-result) 
              ("C-t C-y C-i" . org-babel-previous-src-block) 
              ("C-t C-y C-r" . org-babel-goto-named-result) 
              ("C-t C-y C-s" . org-babel-execute-subtree) 
              ("C-t C-y C-t" . org-babel-tangle) 
              ("C-t C-y C-u" . org-babel-goto-src-block-head) 
              ("C-t C-y C-v" . org-babel-expand-src-block) 
              ("C-t C-y C-x" . org-babel-do-key-sequence-in-edit-buffer) 
              ("C-t C-y C-z" . org-babel-switch-to-session) 
              ("C-t C-y I" . org-babel-view-src-block-info) 
              ("C-t C-y a" . org-babel-sha1-hash) 
              ("C-t C-y b" . org-babel-execute-buffer) 
              ("C-t C-y c" . org-babel-check-src-block) 
              ("C-t C-y d" . org-babel-demarcate-block) 
              ("C-t C-y e" . org-babel-execute-maybe) 
              ("C-t C-y f" . org-babel-tangle-file) 
              ("C-t C-y g" . org-babel-goto-named-src-block) 
              ("C-t C-y h" . org-babel-describe-bindings) 
              ("C-t C-y i" . org-babel-lob-ingest) 
              ("C-t C-y j" . org-babel-insert-header-arg) 
              ("C-t C-y k" . org-babel-remove-result-one-or-many) 
              ("C-t C-y l" . org-babel-load-in-session) 
              ("C-t C-y n" . org-babel-next-src-block) 
              ("C-t C-y o" . org-babel-open-src-block-result) 
              ("C-t C-y p" . org-babel-previous-src-block) 
              ("C-t C-y r" . org-babel-goto-named-result) 
              ("C-t C-y s" . org-babel-execute-subtree) 
              ("C-t C-y t" . org-babel-tangle) 
              ("C-t C-y u" . org-babel-goto-src-block-head) 
              ("C-t C-y v" . org-babel-expand-src-block) 
              ("C-t C-y x" . org-babel-do-key-sequence-in-edit-buffer) 
              ("C-t C-y z" . org-babel-switch-to-session-with-code)
              ("C-t C-y C-M-h" . org-babel-mark-block)
              ("C-t C-x C-a" . org-archive-subtree-default)
              ("C-t C-x C-b" . org-toggle-checkbox)
              ;("C-t C-x C-c" . org-columns)
              ("C-t C-x C-d" . org-clock-display)
              ("C-t C-x C-f" . org-emphasize)
              ("C-t C-x TAB" . org-clock-in)
              ("C-t C-x C-j" . org-clock-goto)
              ("C-t C-x C-l" . org-latex-preview)
              ("C-t C-x C-n" . org-next-link)
              ("C-t C-x C-o" . org-clock-out)
              ("C-t C-x C-p" . org-previous-link)
              ("C-t C-x C-q" . org-clock-cancel)
              ("C-t C-x C-r" . org-toggle-radio-button)
              ("C-t C-x C-s" . org-archive-subtree)
              ("C-t C-x C-t" . org-toggle-time-stamp-overlays)
              ("C-t C-x C-u" . org-dblock-update)
              ("C-t C-x C-v" . org-toggle-inline-images)
              ("C-t C-x M-c" . org-cut-special)
              ("C-t C-x C-x" . org-clock-in-last)
              ("C-t C-x C-y" . org-paste-special)
              ("C-t C-x C-z" . org-resolve-clocks)
              ("C-t C-x !" . org-reload)
              ("C-t C-x ," . org-timer-pause-or-continue)
              ("C-t C-x -" . org-timer-item)
              ("C-t C-x ." . org-timer)
              ("C-t C-x 0" . org-timer-start)
              ("C-t C-x <" . org-agenda-set-restriction-lock)
              ("C-t C-x >" . org-agenda-remove-restriction-lock)
              ("C-t C-x A" . org-archive-to-archive-sibling)
              ("C-t C-x E" . org-inc-effort)
              ("C-t C-x G" . org-feed-goto-inbox)
              ("C-t C-x I" . org-info-find-node)
              ("C-t C-x P" . org-set-property-and-value)
              ("C-t C-x [" . org-reftex-citation)
              ("C-t C-x _" . org-timer-stop)
              ("C-t C-x a" . org-toggle-archive-tag)
              ("C-t C-x b" . org-tree-to-indirect-buffer)
              ("C-t C-x c" . org-clone-subtree-with-time-shift)
              ("C-t C-x d" . org-insert-drawer)
              ("C-t C-x e" . org-set-effort)
              ("C-t C-x f" . org-footnote-action)
              ("C-t C-x g" . org-feed-update-all)
              ("C-t C-x o" . org-toggle-ordered-property)
              ("C-t C-x p" . org-set-property)
              ("C-t C-x q" . org-toggle-tags-groups)
              ("C-t C-x v" . org-copy-visible)
              ("C-t C-x x" . org-dynamic-block-insert-dblock)
              ("C-t C-x C-M-v" . org-redisplay-inline-images)
              ("C-t C-x C-c" . org-copy-special)))

(custom-theme-set-faces
    'vscode-dark-plus
    '(org-level-1 ((t (:foreground "#4ec9b0" :bold nil :height 1.3))))
    '(org-level-2 ((t (:foreground "#9cdcfe" :bold nil :height 1.2))))
    '(org-level-3 ((t (:foreground "#569cd6" :bold nil :height 1.1))))
    '(org-level-4 ((t (:foreground "#4ec9b0" :bold nil :height 1.0)))))

;; special outline mark
(use-package org-superstar 
  :hook (org-mode . org-superstar-mode) 
  :config (setq org-superstar-special-todo-items t))

;; toggle visibility of invisible Org elements depending on cursor position
(use-package org-appear 
  :hook (org-mode . org-appear-mode))

;; Task management and agenda views
;; Store my org files in ~/documents/org, maintain an inbox in Dropbox, define the location of an index file (my main todo list), and archive finished tasks in ~/documents/org/archive.org
(setq org-directory "~/Documents/org")
(defun org-file-path (filename)
  "Return the absolute address of an org file, given its relative name."
  (concat (file-name-as-directory org-directory) filename))

;;(setq org-inbox-file "~/sync/Dropbox/inbox.org")
(setq org-inbox-file "~/Documents/inbox.org")
(setq org-index-file (org-file-path "index.org"))
(setq org-archive-location
      (concat
       (org-file-path (format "archive/archive-%s.org" (format-time-string "%Y")))
       "::* From %s"))

(setq org-refile-targets `((,org-index-file :level . 1)
                           (,(org-file-path "deliveries.org") :level . 1)
                           (,(org-file-path "environment.org") :level . 1)
                           (,(org-file-path "links.org") :level . 1)
                           (,(org-file-path "media.org") :level . 1)
                           (,(org-file-path "someday-maybe.org") :level . 1)
                           (,(org-file-path "work.org") :level . 1)))


;; Exporting
;; Allow export to markdown and beamer (for presentations).
(require 'ox-md)
(require 'ox-beamer)
;; Allow babel to evaluate code blocks in a handful of languages.
(use-package gnuplot)
(org-babel-do-load-languages
 'org-babel-load-languages
 '((ditaa . t)
   (dot . t)
   (emacs-lisp . t)
   (gnuplot . t)
   (ruby . t)
   (shell . t)))
;; Don’t ask before evaluating code blocks.
(setq org-confirm-babel-evaluate nil)
;; Use htmlize to ensure that exported code blocks use syntax highlighting.
(use-package htmlize)
;; Associate the “dot” language with the graphviz-dot major mode.
(use-package graphviz-dot-mode)
(add-to-list 'org-src-lang-modes '("dot" . graphviz-dot))
;; Translate regular ol’ straight quotes to typographically correct curly quotes when exporting.
(setq org-export-with-smart-quotes t)
;; Exporting to HTML
;; Don’t include a footer with my contact and publishing information at the bottom of every exported HTML document.
(setq org-html-postamble nil)
;; Exporting to PDF
;; I want to produce PDFs with syntax highlighting in the code. The best way to do that seems to be with the minted package, but that package shells out to pygments to do the actual work. xelatex usually disallows shell commands; this enables that.
(setq org-latex-pdf-process
      '("xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"))
;; Include the minted package in all of my LaTeX exports.
(add-to-list 'org-latex-packages-alist '("" "minted"))
(setq org-latex-listings 'minted)
;; Remove the intermediate TeX file when exporting to PDF.
(add-to-list 'org-latex-logfiles-extensions "tex")
;; I often want to export a book without “Part I”:
(add-to-list 'org-latex-classes
           '("book-noparts"
              "\\documentclass{book}"
              ("\\chapter{%s}" . "\\chapter*{%s}")
              ("\\section{%s}" . "\\section*{%s}")
              ("\\subsection{%s}" . "\\subsection*{%s}")
              ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
              ("\\paragraph{%s}" . "\\paragraph*{%s}")
              ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

;; TeX configuration
;; I rarely write LaTeX directly any more, but I often export through it with org-mode, so I’m keeping them together.
;; Automatically parse the file after loading it.
(setq TeX-parse-self t)
;; Always use pdflatex when compiling LaTeX documents. I don’t really have any use for DVIs.
(setq TeX-PDF-mode t)
;; Enable a minor mode for dealing with math (it adds a few useful keybindings), and always treat the current file as the “main” file. That’s intentional, since I’m usually actually in an org document.
(add-hook 'LaTeX-mode-hook
          (lambda ()
            (LaTeX-math-mode)
            (setq TeX-master t)))

(provide 'init-org)

;;; init-org.el ends here
