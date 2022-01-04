;;; init-languages.el -*- coding: utf-8; lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; spell check
(setq ispell-program-name "aspell")
(use-package flyspell
  :demand t
  :hook ((text-mode . flyspell-mode)
         (prog-mode . flyspell-prog-mode)))
(use-package flyspell-correct
  :after flyspell
  :bind (:map flyspell-mode-map ("C-;" . flyspell-correct-wrapper)))

;; rust
(use-package rustic)

(use-package toml-mode
  :mode "\\.toml\\'"
  :config
  (add-hook 'toml-mode-hook 'goto-address-prog-mode))

;; python
(setq-default python-indent-offset 4
              python-indent-guess-indent-offset-verbose nil)

;; json
(use-package json-mode
  :mode "\\.json\\'")

;; markdown
(use-package markdown-mode
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown")
  :commands (markdown-mode gfm-mode)
  :config
  (with-eval-after-load 'whitespace-cleanup-mode
    (add-to-list 'whitespace-cleanup-mode-ignore-modes 'markdown-mode)))

;; DOT
(use-package graphviz-dot-mode
  :ensure t
  :mode "\\.dot\\.gv\\'"
  :config (setq graphviz-dot-indent-width 4)
  :bind (:map graphviz-dot-mode-map
              ("C-t C-p" . graphviz-dot-preview)
			  ("C-t v" . graphviz-dot-view)))

;; xml
(use-package nxml-mode
  :ensure nil
  :mode "\\.xml\\.xsd\\.sch\\.rng\\.xslt\\.svg\\.rss\\.gpx\\.tcx\\.plist\\'"
  :config (setq magic-mode-alist (cons '("<\\?xml " . nxml-mode) magic-mode-alist))
          (fset 'xml-mode 'nxml-mode)
          (setq nxml-slash-auto-complete-flag t))

;; See: http://sinewalker.wordpress.com/2008/06/26/pretty-printing-xml-with-emacs-nxml-mode/
(defun sanityinc/pp-xml-region (beg end)
  "Pretty format XML markup in region. The function inserts
linebreaks to separate tags that have nothing but whitespace
between them.  It then indents the markup by using nxml's
indentation rules."
  (interactive "r")
  (unless (use-region-p)
    (setq beg (point-min)
          end (point-max)))
  ;; Use markers because our changes will move END
  (setq beg (set-marker (make-marker) beg)
        end (set-marker (make-marker) end))
  (save-excursion
    (goto-char beg)
    (while (search-forward-regexp "\>[ \\t]*\<" end t)
      (backward-char) (insert "\n"))
    (nxml-mode)
    (indent-region beg end)))

;; Integration with tidy for html + xml

(defun sanityinc/tidy-buffer-xml (beg end)
  "Run \"tidy -xml\" on the region from BEG to END, or whole buffer."
  (interactive "r")
  (unless (use-region-p)
    (setq beg (point-min)
          end (point-max)))
  (shell-command-on-region beg end "tidy -xml -q -i" (current-buffer) t "*tidy-errors*" t))


(provide 'init-languages)

;;; init-languages.el ends here