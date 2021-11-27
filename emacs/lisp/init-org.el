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
              ("C-r C-a" . org-attach) 
              ("C-r C-j" . org-backward-heading-same-level) 
              ("C-r C-r" . org-ctrl-c-ctrl-c) 
              ("C-r C-d" . org-deadline) 
              ("C-r C-e" . org-export-dispatch) 
              ("C-r C-l" . org-forward-heading-same-level) 
              ("C-r j" . org-goto) 
              ("C-r k" . org-kill-note-or-show-branches) 
              ("C-r l" . org-insert-link) 
              ("C-r C-o" . org-open-at-point) 
              ("C-r C-q" . org-set-tags-command) 
              ("C-r r" . org-reveal) 
              ("C-r C-s" . org-schedule) 
              ("C-r C-t" . org-todo) 
              ("C-r C-w" . org-refile) 
              ("C-r C-y" . org-evaluate-time-range) 
              ("C-r C-z" . org-add-note) 
              ("C-r C-^" . org-up-element) 
              ("C-r C-_" . org-down-element) 
              ("C-r C-*" . org-list-make-subtree) 
              ("C-r C-," . org-insert-structure-template) 
              ("C-r C-k" . outline-next-visible-heading) ;
              ("C-r C-i" . outline-previous-visible-heading) ;
              ("C-r C-u" . outline-up-heading) 
              ("C-r C-<" . outline-promote) 
              ("C-r C->" . outline-demote) 
              ("C-r M-j" . org-previous-block) 
              ("C-r M-l" . org-next-block) 
              ("C-r M-i" . org-insert-last-stored-link) 
              ("C-r C-c" . org-refile-copy) 
              ("C-r C-M-l" . org-insert-all-links) 
              ("C-r C-TAB" . org-force-cycle-archived) 
              ("C-r TAB" . org-ctrl-c-tab) 
              ("C-r SPC" . org-table-blank-field) 
              ("C-r RET" . org-ctrl-c-ret) 
              ("C-r a" . org-agenda) 
              ("C-r #" . org-update-statistics-cookies) 
              ("C-r $" . org-archive-subtree) 
              ("C-r %" . org-mark-ring-push) 
              ("C-r '" . org-edit-special) 
              ("C-r *" . org-ctrl-c-star) 
              ("C-r +" . org-table-sum) 
              ("C-r ," . org-priority) 
              ("C-r -" . org-ctrl-c-minus) 
              ("C-r ." . org-time-stamp) 
              ("C-r /" . org-sparse-tree) 
              ("C-r \;" . org-toggle-comment) 
              ("C-r <" . org-date-from-calendar) 
              ("C-r =" . org-table-eval-formula) 
              ("C-r >" . org-goto-calendar) 
              ("C-r ?" . org-table-field-info) 
              ("C-r @" . org-mark-subtree) 
              ("C-r [" . org-agenda-file-to-front) 
              ("C-r \\" . org-match-sparse-tree) 
              ("C-r \]" . org-remove-file) 
              ("C-r ^" . org-sort) 
              ("C-r `" . org-table-edit-field) 
              ("C-r {" . org-table-toggle-formula-debugger) 
              ("C-r |" . org-table-create-or-convert-from-region) 
              ("C-r }" . org-table-toggle-coordinate-overlays) 
              ("C-r ~" . org-table-create-with-table.el) 
              ("C-r C-v C-a" . org-babel-sha1-hash) 
              ("C-r C-v C-j" . org-babel-execute-buffer) 
              ("C-r C-v C-c" . org-babel-check-src-block) 
              ("C-r C-v C-d" . org-babel-demarcate-block) 
              ("C-r C-v C-e" . org-babel-execute-maybe) 
              ("C-r C-v C-l" . org-babel-tangle-file) 
              ("C-r C-v TAB" . org-babel-view-src-block-info) 
              ;("C-r C-v C-j" . org-babel-insert-header-arg) 
              ;("C-r C-v C-l" . org-babel-load-in-session) 
              ("C-r C-v C-k" . org-babel-next-src-block) 
              ("C-r C-v C-o" . org-babel-open-src-block-result) 
              ("C-r C-v C-i" . org-babel-previous-src-block) 
              ("C-r C-v C-r" . org-babel-goto-named-result) 
              ("C-r C-v C-s" . org-babel-execute-subtree) 
              ("C-r C-v C-t" . org-babel-tangle) 
              ("C-r C-v C-u" . org-babel-goto-src-block-head) 
              ("C-r C-v C-v" . org-babel-expand-src-block) 
              ("C-r C-v C-x" . org-babel-do-key-sequence-in-edit-buffer) 
              ("C-r C-v C-z" . org-babel-switch-to-session) 
              ("C-r C-v I" . org-babel-view-src-block-info) 
              ("C-r C-v a" . org-babel-sha1-hash) 
              ("C-r C-v b" . org-babel-execute-buffer) 
              ("C-r C-v c" . org-babel-check-src-block) 
              ("C-r C-v d" . org-babel-demarcate-block) 
              ("C-r C-v e" . org-babel-execute-maybe) 
              ("C-r C-v f" . org-babel-tangle-file) 
              ("C-r C-v g" . org-babel-goto-named-src-block) 
              ("C-r C-v h" . org-babel-describe-bindings) 
              ("C-r C-v i" . org-babel-lob-ingest) 
              ("C-r C-v j" . org-babel-insert-header-arg) 
              ("C-r C-v k" . org-babel-remove-result-one-or-many) 
              ("C-r C-v l" . org-babel-load-in-session) 
              ("C-r C-v n" . org-babel-next-src-block) 
              ("C-r C-v o" . org-babel-open-src-block-result) 
              ("C-r C-v p" . org-babel-previous-src-block) 
              ("C-r C-v r" . org-babel-goto-named-result) 
              ("C-r C-v s" . org-babel-execute-subtree) 
              ("C-r C-v t" . org-babel-tangle) 
              ("C-r C-v u" . org-babel-goto-src-block-head) 
              ("C-r C-v v" . org-babel-expand-src-block) 
              ("C-r C-v x" . org-babel-do-key-sequence-in-edit-buffer) 
              ("C-r C-v z" . org-babel-switch-to-session-with-code)
              ("C-r C-v C-M-h" . org-babel-mark-block)
              ("C-r C-x C-a" . org-archive-subtree-default)
              ("C-r C-x C-b" . org-toggle-checkbox)
              ;("C-r C-x C-c" . org-columns)
              ("C-r C-x C-d" . org-clock-display)
              ("C-r C-x C-f" . org-emphasize)
              ("C-r C-x TAB" . org-clock-in)
              ("C-r C-x C-j" . org-clock-goto)
              ("C-r C-x C-l" . org-latex-preview)
              ("C-r C-x C-n" . org-next-link)
              ("C-r C-x C-o" . org-clock-out)
              ("C-r C-x C-p" . org-previous-link)
              ("C-r C-x C-q" . org-clock-cancel)
              ("C-r C-x C-r" . org-toggle-radio-button)
              ("C-r C-x C-s" . org-archive-subtree)
              ("C-r C-x C-t" . org-toggle-time-stamp-overlays)
              ("C-r C-x C-u" . org-dblock-update)
              ("C-r C-x C-v" . org-toggle-inline-images)
              ("C-r C-x M-c" . org-cut-special)
              ("C-r C-x C-x" . org-clock-in-last)
              ("C-r C-x C-y" . org-paste-special)
              ("C-r C-x C-z" . org-resolve-clocks)
              ("C-r C-x !" . org-reload)
              ("C-r C-x ," . org-timer-pause-or-continue)
              ("C-r C-x -" . org-timer-item)
              ("C-r C-x ." . org-timer)
              ("C-r C-x 0" . org-timer-start)
              ("C-r C-x <" . org-agenda-set-restriction-lock)
              ("C-r C-x >" . org-agenda-remove-restriction-lock)
              ("C-r C-x A" . org-archive-to-archive-sibling)
              ("C-r C-x E" . org-inc-effort)
              ("C-r C-x G" . org-feed-goto-inbox)
              ("C-r C-x I" . org-info-find-node)
              ("C-r C-x P" . org-set-property-and-value)
              ("C-r C-x [" . org-reftex-citation)
              ("C-r C-x _" . org-timer-stop)
              ("C-r C-x a" . org-toggle-archive-tag)
              ("C-r C-x b" . org-tree-to-indirect-buffer)
              ("C-r C-x c" . org-clone-subtree-with-time-shift)
              ("C-r C-x d" . org-insert-drawer)
              ("C-r C-x e" . org-set-effort)
              ("C-r C-x f" . org-footnote-action)
              ("C-r C-x g" . org-feed-update-all)
              ("C-r C-x o" . org-toggle-ordered-property)
              ("C-r C-x p" . org-set-property)
              ("C-r C-x q" . org-toggle-tags-groups)
              ("C-r C-x v" . org-copy-visible)
              ("C-r C-x x" . org-dynamic-block-insert-dblock)
              ("C-r C-x C-M-v" . org-redisplay-inline-images)
              ("C-r C-x C-c" . org-copy-special)))

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
