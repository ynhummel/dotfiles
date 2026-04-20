;; -*- lexical-binding: t; -*-

(setq custom-file "~/.emacs.d/custom.el")
(load-file custom-file)
(setq make-backup-files nil)
(setq auto-save-default nil)

;INTERFACE
;---------------------------------------------------------------------------
(use-package emacs
  :custom
  ;; Enable context menu. `vertico-multiform-mode' adds a menu in the minibuffer to switch display modes.
  (context-menu-mode t)
  ;; Support opening new minibuffers from inside existing minibuffers.
  (enable-recursive-minibuffers t)
  ;; Hide commands in M-x which do not work in the current mode.  Vertico
  ;; commands are hidden in normal buffers. This setting is useful beyond
  ;; Vertico.
  (read-extended-command-predicate #'command-completion-default-include-p)
  ;; Do not allow the cursor in the minibuffer prompt
  (minibuffer-prompt-properties
   '(read-only t cursor-intangible t face minibuffer-prompt)))

(setq inhibit-startup-message t)

(menu-bar-mode -1)          ; Disable the menu bar
(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar
(tooltip-mode -1)           ; Disable tooltips
(set-fringe-mode 2)         ; Give some breathing room

(set-frame-parameter nil 'alpha-background 94)
(add-to-list 'default-frame-alist '(alpha-background . 94))
;---------------------------------------------------------------------------

;EDITOR
;---------------------------------------------------------------------------
(set-face-attribute 'default nil :font "JetBrainsMono Nerd Font" :height 140)

(column-number-mode t)
(global-display-line-numbers-mode 1)
(setq display-line-numbers-width 4)
(setq display-line-numbers-type 'relative)
(setq-default truncate-lines t)

(setq scroll-margin 8
      scroll-conservatively 10)
(setq inhibit-startup-message t)

(setq-default indent-tabs-mode nil)
;---------------------------------------------------------------------------

;PACKAGES
;---------------------------------------------------------------------------
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-and-compile
  (setq use-package-expand-minimally t))
;---------------------------------------------------------------------------

;THEMES
;---------------------------------------------------------------------------
(use-package kanagawa-themes
  :ensure t)

(load-theme 'kanagawa-wave t)
;---------------------------------------------------------------------------

;COMPLETION
;---------------------------------------------------------------------------
(use-package completion-preview
  :ensure nil
  :hook (prog-mode . completion-preview-mode)
  :bind
  ( :map completion-preview-active-mode-map
    ("M-n" . completion-preview-next-candidate)
    ("M-p" . completion-preview-prev-candidate)))

(use-package vertico
  :ensure t
  :custom
  ;; (vertico-scroll-margin 0) ;; Different scroll margin
  ;; (vertico-count 20) ;; Show more candidates
  ;; (vertico-resize t) ;; Grow and shrink the Vertico minibuffer
  (vertico-cycle t) ;; Enable cycling for `vertico-next/previous'
  :init
  (vertico-mode))
;---------------------------------------------------------------------------

;ORG
;---------------------------------------------------------------------------
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
;---------------------------------------------------------------------------

;GIT
;---------------------------------------------------------------------------
(use-package git-gutter
  :ensure t
  :hook (prog-mode . git-gutter-mode)
  :config
  (setq git-gutter:update-interval 0.02))

(use-package git-gutter-fringe
  :ensure t
  :config
  (define-fringe-bitmap 'git-gutter-fr:added [224] nil nil '(center repeated))
  (define-fringe-bitmap 'git-gutter-fr:modified [224] nil nil '(center repeated))
  (define-fringe-bitmap 'git-gutter-fr:deleted [128 192 224 240] nil nil 'bottom))
;---------------------------------------------------------------------------

;PROGRAMMING LANGUAGES
;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
