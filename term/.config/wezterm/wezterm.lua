-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

config.term = "wezterm"

-- Terminal Appearence
config.color_scheme = 'Kanagawa (Gogh)'
config.window_decorations = "TITLE"
config.window_background_opacity = 0.94
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

-- Font
config.font_size = 14
config.font = wezterm.font "JetBrainsMono Nerd Font"

-- Disable keybinds
-- config.disable_default_key_bindings = true

-- Finally, return the configuration to wezterm:
return config
