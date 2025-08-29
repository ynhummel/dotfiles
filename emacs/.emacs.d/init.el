(setq custom-file "~/.emacs.d/custom.el")
(load-file custom-file)

(setq inhibit-startup-message t)

(menu-bar-mode -1)          ; Disable the menu bar
(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar
(tooltip-mode -1)           ; Disable tooltips
(set-fringe-mode 0)         ; Give some breathing room

(set-face-attribute 'default nil :font "JetBrainsMono Nerd Font" :height 140)

(global-display-line-numbers-mode 1)
        (setq display-line-numbers-type 'relative)
(setq display-line-numbers-type 'relative)

(setq scroll-margin 8
      scroll-conservatively 10)
(setq inhibit-startup-message t)

(load-theme 'wombat)

(setq mac-command-modifier 'meta)

(setq-default indent-tabs-mode nil)

;;;                   ;;;
;;;    Treesitter     ;;;
;;;                   ;;;

(setq treesit-language-source-alist
      '((go "https://github.com/tree-sitter/tree-sitter-go")
        (gomod "https://github.com/camdencheek/tree-sitter-go-mod")))

;;;                   ;;;
;;;  Package Manager  ;;;
;;;                   ;;;

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-and-compile
  (setq use-package-expand-minimally t))

(use-package racket-mode
  :ensure t)

(use-package go-ts-mode
  :ensure t
  :mode ("\\.go\\'" . go-ts-mode))

