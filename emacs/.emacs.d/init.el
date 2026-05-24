;; -*- lexical-binding: t; -*-
(setq custom-file "~/.emacs.d/custom.el")
(load-file custom-file)
(setq use-package-always-ensure nil)

;;---------------------------------------------------------------------------
;; EMACS CORE
;;---------------------------------------------------------------------------
(use-package emacs
  :custom
  ;; Backups and autosave
  (make-backup-files nil)
  (auto-save-default nil)

  ;; Startup
  (inhibit-startup-message t)

  ;; Scrolling
  (scroll-margin 8)
  (scroll-conservatively 10)

  ;; Editor Behaviour
  (indent-tabs-mode nil)
  (truncate-lines t)

  ;; Line Numbers
  (display-line-numbers-width 4)
  (display-line-numbers-type 'relative)

  ;; Recursive Minibuffer
  (enable-recursive-minibuffers t)
  (minibuffer-depth-indicate-mode 1)

  :config
  ;; UI Elements
  (menu-bar-mode -1)       ; Disable the menu bar
  (scroll-bar-mode -1)     ; Disable visible scrollbar
  (tool-bar-mode -1)       ; Disable the toolbar
  (tooltip-mode -1)        ; Disable tooltips
  (set-fringe-mode 2)      ; Give some breathing room

  ;; Modes
  (column-number-mode t)
  (global-display-line-numbers-mode 1)
  (fido-vertical-mode t)

  ;; Fonts and Transparency
  (set-face-attribute 'default nil :font "JetBrainsMono Nerd Font" :height 140)
  (set-frame-parameter nil 'alpha-background 90)
  (add-to-list 'default-frame-alist '(alpha-background . 90)))

;;---------------------------------------------------------------------------
;; THEMES
;;---------------------------------------------------------------------------
;; MODUS
(load-theme 'modus-vivendi-tinted t)

;;---------------------------------------------------------------------------
;; COMPLETION
;;---------------------------------------------------------------------------
(use-package completion-preview
  :ensure nil
  :hook (prog-mode . completion-preview-mode)
  :bind
  ( :map completion-preview-active-mode-map
    ("M-n" . completion-preview-next-candidate)
    ("M-p" . completion-preview-prev-candidate)))

;;---------------------------------------------------------------------------
;; ORG
;;---------------------------------------------------------------------------
(use-package org
  :hook  (org-mode . (lambda () 
                       (visual-line-mode 1)
                       (display-line-numbers-mode -1)))
  :config
  (setq org-agenda-files '("~/orgfiles/agenda"))
  ;; Visual Customization
  (setq org-adapt-indentation nil)
  (setq org-startup-indented t)
  (setq org-hide-leading-stars t)
  (setq org-hide-emphasis-markers t)
  (setq org-ellipsis " ⌄"))
