(setq custom-file "~/.emacs.d/custom.el")

(setq inhibit-startup-message t)

(menu-bar-mode -1)            ; Disable the menu bar
(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar
(tooltip-mode -1)           ; Disable tooltips
(set-fringe-mode 0)        ; Give some breathing room

(set-face-attribute 'default nil :font "JetBrainsMono Nerd Font" :height 140)

(global-display-line-numbers-mode 1)
        (setq display-line-numbers-type 'relative)
(setq display-line-numbers-type 'relative)

(setq scroll-margin 8
      scroll-conservatively 10)
(setq inhibit-startup-message t)

(load-theme 'wombat) 
