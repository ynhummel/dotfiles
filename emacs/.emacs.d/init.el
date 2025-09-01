;; -*- lexical-binding: t; -*-

(setq custom-file "~/.emacs.d/custom.el")
(load-file custom-file)

;;. Emacs Interface

(setq inhibit-startup-message t)

(menu-bar-mode -1)          ; Disable the menu bar
(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar
(tooltip-mode -1)           ; Disable tooltips
(set-fringe-mode 0)         ; Give some breathing room

;;. General editor Preferences

(set-face-attribute 'default nil :font "JetBrainsMono Nerd Font" :height 140)
(column-number-mode t)
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)

(setq scroll-margin 8
      scroll-conservatively 10)
(setq inhibit-startup-message t)

(setq-default indent-tabs-mode nil)

;;. MacOS configs

(setq mac-command-modifier 'meta)

;;. Package Manager

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-and-compile
  (setq use-package-expand-minimally t))

;;. Terminal

(use-package vterm
  :ensure t)

;;. Themes

(use-package solarized-theme
  :ensure t)
(load-theme 'solarized-dark)

;;. Eglot

(use-package eglot
  :ensure t
  :hook (go-ts-mode . eglot-ensure))

;;. Languages

(use-package treesit-auto
  :ensure t
  :custom
  (treesit-auto-install 'prompt)
  :config
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode))

(use-package racket-mode
  :ensure t)

