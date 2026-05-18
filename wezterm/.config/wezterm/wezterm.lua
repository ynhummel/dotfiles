-- Start wezterm configuration
local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.term = "xterm-256color"
config.enable_wayland = false

-- Terminal Appearence
config.color_scheme = 'Gnometerm (terminal.sexy)'
config.window_decorations = "TITLE"
config.window_background_opacity = 0.80

-- Tab Bar
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

-- Font
config.font_size = 14
config.font = wezterm.font("JetBrainsMono Nerd Font", {
  weight = "Regular",
  stretch = "Normal",
  style = "Normal"
})

-- Mousebinds
config.mouse_bindings = {
  -- Disable the default click behavior
  {
    event = { Up = { streak = 1, button = "Left"} },
    mods = "NONE",
    action = wezterm.action.DisableDefaultAssignment,
  },
  -- Ctrl-click will open the link under the mouse cursor
  {
      event = { Up = { streak = 1, button = "Left" } },
      mods = "CTRL",
      action = wezterm.action.OpenLinkAtMouseCursor,
  },
  -- Disable the Ctrl-click down event to stop programs from seeing it when a URL is clicked
  {
      event = { Down = { streak = 1, button = "Left" } },
      mods = "CTRL",
      action = wezterm.action.Nop,
  },
}

-- Keybinds
config.keys = {
  { key = 'Enter', mods = 'ALT', action = wezterm.action.ToggleFullScreen },
  -- PANES
  { key = '\"', mods = 'SHIFT|CTRL', action = wezterm.action.SplitVertical{ domain =  'CurrentPaneDomain' } },
  { key = '%', mods = 'SHIFT|CTRL', action = wezterm.action.SplitHorizontal{ domain =  'CurrentPaneDomain' } },
  { key = 'h', mods = 'SHIFT|ALT', action = wezterm.action.ActivatePaneDirection 'Left' },
  { key = 'l', mods = 'SHIFT|ALT', action = wezterm.action.ActivatePaneDirection 'Right' },
  { key = 'k', mods = 'SHIFT|ALT', action = wezterm.action.ActivatePaneDirection 'Up' },
  { key = 'j', mods = 'SHIFT|ALT', action = wezterm.action.ActivatePaneDirection 'Down' },
  { key = 'LeftArrow', mods = 'SHIFT|ALT', action = wezterm.action.AdjustPaneSize{ 'Left', 1 } },
  { key = 'RightArrow', mods = 'SHIFT|ALT', action = wezterm.action.AdjustPaneSize{ 'Right', 1 } },
  { key = 'UpArrow', mods = 'SHIFT|ALT', action = wezterm.action.AdjustPaneSize{ 'Up', 1 } },
  { key = 'DownArrow', mods = 'SHIFT|ALT', action = wezterm.action.AdjustPaneSize{ 'Down', 1 } },
  -- TABS
  { key = 'Tab', mods = 'CTRL', action = wezterm.action.ActivateTabRelative(1) },
  { key = 'Tab', mods = 'SHIFT|CTRL', action = wezterm.action.ActivateTabRelative(-1) },
  { key = ')', mods = 'SHIFT|CTRL', action = wezterm.action.ActivateTabRelative(1) },
  { key = '(', mods = 'SHIFT|CTRL', action = wezterm.action.ActivateTabRelative(-1) },
  { key = '1', mods = 'SHIFT|CTRL', action = wezterm.action.ActivateTab(0) },
  { key = '2', mods = 'SHIFT|CTRL', action = wezterm.action.ActivateTab(1) },
  { key = '3', mods = 'SHIFT|CTRL', action = wezterm.action.ActivateTab(2) },
  { key = '4', mods = 'SHIFT|CTRL', action = wezterm.action.ActivateTab(3) },
  { key = '5', mods = 'SHIFT|CTRL', action = wezterm.action.ActivateTab(4) },
  { key = '6', mods = 'SHIFT|CTRL', action = wezterm.action.ActivateTab(5) },
  { key = '7', mods = 'SHIFT|CTRL', action = wezterm.action.ActivateTab(6) },
  { key = '8', mods = 'SHIFT|CTRL', action = wezterm.action.ActivateTab(7) },
  { key = '9', mods = 'SHIFT|CTRL', action = wezterm.action.ActivateTab(-1) },
  { key = 'PageUp', mods = 'SHIFT|CTRL', action = wezterm.action.MoveTabRelative(-1) },
  { key = 'PageDown', mods = 'SHIFT|CTRL', action = wezterm.action.MoveTabRelative(1) },
  -- FONT SIZE
  { key = '=', mods = 'CTRL', action = wezterm.action.IncreaseFontSize },
  { key = '-', mods = 'CTRL', action = wezterm.action.DecreaseFontSize },
  { key = '0', mods = 'CTRL', action = wezterm.action.ResetFontSize },
  -- MISC
  { key = 'c', mods = 'SHIFT|CTRL', action = wezterm.action.CopyTo 'Clipboard' },
  { key = 'f', mods = 'SHIFT|CTRL', action = wezterm.action.Search 'CurrentSelectionOrEmptyString' },
  { key = 'k', mods = 'SHIFT|CTRL', action = wezterm.action.ClearScrollback 'ScrollbackOnly' },
  { key = 'l', mods = 'SHIFT|CTRL', action = wezterm.action.ShowDebugOverlay },
  { key = 'm', mods = 'SHIFT|CTRL', action = wezterm.action.Hide },
  { key = 'n', mods = 'SHIFT|CTRL', action = wezterm.action.SpawnWindow },
  { key = 'p', mods = 'SHIFT|CTRL', action = wezterm.action.ActivateCommandPalette },
  { key = 'r', mods = 'SHIFT|CTRL', action = wezterm.action.ReloadConfiguration },
  { key = 't', mods = 'SHIFT|CTRL', action = wezterm.action.SpawnTab 'CurrentPaneDomain' },
  { key = 'u', mods = 'SHIFT|CTRL', action = wezterm.action.CharSelect{ copy_on_select = true, copy_to =  'ClipboardAndPrimarySelection' } },
  { key = 'v', mods = 'SHIFT|CTRL', action = wezterm.action.PasteFrom 'Clipboard' },
  { key = 'w', mods = 'SHIFT|CTRL', action = wezterm.action.CloseCurrentTab{ confirm = true } },
  { key = 'x', mods = 'SHIFT|CTRL', action = wezterm.action.ActivateCopyMode },
  { key = 'z', mods = 'SHIFT|CTRL', action = wezterm.action.TogglePaneZoomState },
  { key = 'phys:Space', mods = 'SHIFT|CTRL', action = wezterm.action.QuickSelect },
  -- COPY MODE
  -- { key = 'Tab', mods = 'NONE', action = wezterm.action.CopyMode 'MoveForwardWord' },
  -- { key = 'Tab', mods = 'SHIFT', action = wezterm.action.CopyMode 'MoveBackwardWord' },
  -- { key = 'Enter', mods = 'NONE', action = wezterm.action.CopyMode 'MoveToStartOfNextLine' },
  -- { key = 'Escape', mods = 'NONE', action = wezterm.action.Multiple{ 'ScrollToBottom', { CopyMode =  'Close' } } },
  -- { key = 'Space', mods = 'NONE', action = wezterm.action.CopyMode{ SetSelectionMode =  'Cell' } },
  -- { key = '$', mods = 'NONE', action = wezterm.action.CopyMode 'MoveToEndOfLineContent' },
  -- { key = '$', mods = 'SHIFT', action = wezterm.action.CopyMode 'MoveToEndOfLineContent' },
  -- { key = ',', mods = 'NONE', action = wezterm.action.CopyMode 'JumpReverse' },
  -- { key = '0', mods = 'NONE', action = wezterm.action.CopyMode 'MoveToStartOfLine' },
  -- { key = ';', mods = 'NONE', action = wezterm.action.CopyMode 'JumpAgain' },
  -- { key = 'F', mods = 'NONE', action = wezterm.action.CopyMode{ JumpBackward = { prev_char = false } } },
  -- { key = 'F', mods = 'SHIFT', action = wezterm.action.CopyMode{ JumpBackward = { prev_char = false } } },
  -- { key = 'G', mods = 'NONE', action = wezterm.action.CopyMode 'MoveToScrollbackBottom' },
  -- { key = 'G', mods = 'SHIFT', action = wezterm.action.CopyMode 'MoveToScrollbackBottom' },
  -- { key = 'H', mods = 'NONE', action = wezterm.action.CopyMode 'MoveToViewportTop' },
  -- { key = 'H', mods = 'SHIFT', action = wezterm.action.CopyMode 'MoveToViewportTop' },
  -- { key = 'L', mods = 'NONE', action = wezterm.action.CopyMode 'MoveToViewportBottom' },
  -- { key = 'L', mods = 'SHIFT', action = wezterm.action.CopyMode 'MoveToViewportBottom' },
  -- { key = 'M', mods = 'NONE', action = wezterm.action.CopyMode 'MoveToViewportMiddle' },
  -- { key = 'M', mods = 'SHIFT', action = wezterm.action.CopyMode 'MoveToViewportMiddle' },
  -- { key = 'O', mods = 'NONE', action = wezterm.action.CopyMode 'MoveToSelectionOtherEndHoriz' },
  -- { key = 'O', mods = 'SHIFT', action = wezterm.action.CopyMode 'MoveToSelectionOtherEndHoriz' },
  -- { key = 'T', mods = 'NONE', action = wezterm.action.CopyMode{ JumpBackward = { prev_char = true } } },
  -- { key = 'T', mods = 'SHIFT', action = wezterm.action.CopyMode{ JumpBackward = { prev_char = true } } },
  -- { key = 'V', mods = 'NONE', action = wezterm.action.CopyMode{ SetSelectionMode =  'Line' } },
  -- { key = 'V', mods = 'SHIFT', action = wezterm.action.CopyMode{ SetSelectionMode =  'Line' } },
  -- { key = '^', mods = 'NONE', action = wezterm.action.CopyMode 'MoveToStartOfLineContent' },
  -- { key = '^', mods = 'SHIFT', action = wezterm.action.CopyMode 'MoveToStartOfLineContent' },
  -- { key = 'b', mods = 'NONE', action = wezterm.action.CopyMode 'MoveBackwardWord' },
  -- { key = 'b', mods = 'ALT', action = wezterm.action.CopyMode 'MoveBackwardWord' },
  -- { key = 'b', mods = 'CTRL', action = wezterm.action.CopyMode 'PageUp' },
  -- { key = 'c', mods = 'CTRL', action = wezterm.action.Multiple{ 'ScrollToBottom', { CopyMode =  'Close' } } },
  -- { key = 'd', mods = 'CTRL', action = wezterm.action.CopyMode{ MoveByPage = (0.5) } },
  -- { key = 'e', mods = 'NONE', action = wezterm.action.CopyMode 'MoveForwardWordEnd' },
  -- { key = 'f', mods = 'NONE', action = wezterm.action.CopyMode{ JumpForward = { prev_char = false } } },
  -- { key = 'f', mods = 'ALT', action = wezterm.action.CopyMode 'MoveForwardWord' },
  -- { key = 'f', mods = 'CTRL', action = wezterm.action.CopyMode 'PageDown' },
  -- { key = 'g', mods = 'NONE', action = wezterm.action.CopyMode 'MoveToScrollbackTop' },
  -- { key = 'g', mods = 'CTRL', action = wezterm.action.Multiple{ 'ScrollToBottom', { CopyMode =  'Close' } } },
  -- { key = 'h', mods = 'NONE', action = wezterm.action.CopyMode 'MoveLeft' },
  -- { key = 'j', mods = 'NONE', action = wezterm.action.CopyMode 'MoveDown' },
  -- { key = 'k', mods = 'NONE', action = wezterm.action.CopyMode 'MoveUp' },
  -- { key = 'l', mods = 'NONE', action = wezterm.action.CopyMode 'MoveRight' },
  -- { key = 'm', mods = 'ALT', action = wezterm.action.CopyMode 'MoveToStartOfLineContent' },
  -- { key = 'o', mods = 'NONE', action = wezterm.action.CopyMode 'MoveToSelectionOtherEnd' },
  -- { key = 'q', mods = 'NONE', action = wezterm.action.Multiple{ 'ScrollToBottom', { CopyMode =  'Close' } } },
  -- { key = 't', mods = 'NONE', action = wezterm.action.CopyMode{ JumpForward = { prev_char = true } } },
  -- { key = 'u', mods = 'CTRL', action = wezterm.action.CopyMode{ MoveByPage = (-0.5) } },
  -- { key = 'v', mods = 'NONE', action = wezterm.action.CopyMode{ SetSelectionMode =  'Cell' } },
  -- { key = 'v', mods = 'CTRL', action = wezterm.action.CopyMode{ SetSelectionMode =  'Block' } },
  -- { key = 'w', mods = 'NONE', action = wezterm.action.CopyMode 'MoveForwardWord' },
  -- { key = 'y', mods = 'NONE', action = wezterm.action.Multiple{ { CopyTo =  'ClipboardAndPrimarySelection' }, { Multiple = { 'ScrollToBottom', { CopyMode =  'Close' } } } } },
  -- { key = 'PageUp', mods = 'NONE', action = wezterm.action.CopyMode 'PageUp' },
  -- { key = 'PageDown', mods = 'NONE', action = wezterm.action.CopyMode 'PageDown' },
  -- { key = 'End', mods = 'NONE', action = wezterm.action.CopyMode 'MoveToEndOfLineContent' },
  -- { key = 'Home', mods = 'NONE', action = wezterm.action.CopyMode 'MoveToStartOfLine' },
  -- { key = 'LeftArrow', mods = 'NONE', action = wezterm.action.CopyMode 'MoveLeft' },
  -- { key = 'LeftArrow', mods = 'ALT', action = wezterm.action.CopyMode 'MoveBackwardWord' },
  -- { key = 'RightArrow', mods = 'NONE', action = wezterm.action.CopyMode 'MoveRight' },
  -- { key = 'RightArrow', mods = 'ALT', action = wezterm.action.CopyMode 'MoveForwardWord' },
  -- { key = 'UpArrow', mods = 'NONE', action = wezterm.action.CopyMode 'MoveUp' },
  -- { key = 'DownArrow', mods = 'NONE', action = wezterm.action.CopyMode 'MoveDown' },
  -- SEARCH MODE
  -- { key = 'Enter', mods = 'NONE', action = wezterm.action.CopyMode 'PriorMatch' },
  -- { key = 'Escape', mods = 'NONE', action = wezterm.action.CopyMode 'Close' },
  -- { key = 'n', mods = 'CTRL', action = wezterm.action.CopyMode 'NextMatch' },
  -- { key = 'p', mods = 'CTRL', action = wezterm.action.CopyMode 'PriorMatch' },
  -- { key = 'r', mods = 'CTRL', action = wezterm.action.CopyMode 'CycleMatchType' },
  -- { key = 'u', mods = 'CTRL', action = wezterm.action.CopyMode 'ClearPattern' },
  -- { key = 'PageUp', mods = 'NONE', action = wezterm.action.CopyMode 'PriorMatchPage' },
  -- { key = 'PageDown', mods = 'NONE', action = wezterm.action.CopyMode 'NextMatchPage' },
  -- { key = 'UpArrow', mods = 'NONE', action = wezterm.action.CopyMode 'PriorMatch' },
  -- { key = 'DownArrow', mods = 'NONE', action = wezterm.action.CopyMode 'NextMatch' },
}

return config
