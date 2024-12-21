local wezterm = require("wezterm")
local config = wezterm.config_builder()

config = {
	-- Window and theme
	window_decorations = "RESIZE",
	adjust_window_size_when_changing_font_size = false,
	window_background_opacity = 0.95,
	macos_window_background_blur = 0,
	window_padding = {
		left = "0.5cell",
		right = 0,
		top = "0.2cell",
		bottom = 0,
	},
	cursor_blink_rate = 500,

	-- Tab bar
	enable_tab_bar = true,
	use_fancy_tab_bar = false,
	-- tab_bar_at_bottom = true,
	hide_tab_bar_if_only_one_tab = true,

	-- colorSchemes
	color_scheme = "tokyonight-storm",
	-- color_scheme = "Nord (Gogh)",
	-- color_scheme = "'Gruvbox Material (Gogh)",

	-- Font Configuration
	font = wezterm.font("JetBrains Mono"),
	font_size = 12,
}

return config
