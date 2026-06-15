-- Start wezterm configuration
local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- config.term = "xterm-256color"
config.term = "wezterm"
config.enable_wayland = false

-- Terminal Appearence
config.color_scheme = 'Gnometerm (terminal.sexy)'
config.window_decorations = "TITLE"
config.window_background_opacity = 0.80

-- Tab Bar
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true
wezterm.on('update-status', function(window, pane)
  local workspace = window:active_workspace()
  local overrides = window:get_config_overrides() or {}
  local changed = false

  -- If we are NOT in the 'default' workspace, force the tab bar to show
  if workspace ~= 'default' then
    if overrides.hide_tab_bar_if_only_one_tab ~= false then
      overrides.hide_tab_bar_if_only_one_tab = false
      changed = true
    end
  else
    -- If we ARE in 'default', remove the override so it falls back to the base config (true)
    if overrides.hide_tab_bar_if_only_one_tab ~= nil then
      overrides.hide_tab_bar_if_only_one_tab = nil
      changed = true
    end
  end

  -- Only apply overrides if something actually changed to avoid unnecessary redraws
  if changed then
    window:set_config_overrides(overrides)
  end
end)

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

config.unix_domains = {
  {
    -- To use with Super+T when using niri
    name = 'niri-shared',
  },
}

-- Font
config.font_size = 14
config.adjust_window_size_when_changing_font_size = false
config.font = wezterm.font("JetBrainsMono Nerd Font", {
  weight = "Regular",
  stretch = "Normal",
  style = "Normal"
})

-- ACTIONS
local act = wezterm.action

-- Display Workspace name in status bar
wezterm.on('update-right-status', function(window, pane)
  window:set_right_status(window:active_workspace())
end)


-- Mousebinds
config.mouse_bindings = {
  -- Disable the default click behavior
  {
    event = { Up = { streak = 1, button = "Left"} },
    mods = "NONE",
    action = act.DisableDefaultAssignment,
  },
  -- Ctrl-click will open the link under the mouse cursor
  {
      event = { Up = { streak = 1, button = "Left" } },
      mods = "CTRL",
      action = act.OpenLinkAtMouseCursor,
  },
  -- Disable the Ctrl-click down event to stop programs from seeing it when a URL is clicked
  {
      event = { Down = { streak = 1, button = "Left" } },
      mods = "CTRL",
      action = act.Nop,
  },
}

-- Keybinds
config.keys = {
  { key = 'F11', mods = '', action = act.ToggleFullScreen },
  -- PANES
  { key = '\"', mods = 'SHIFT|CTRL', action = act.SplitVertical{ domain =  'CurrentPaneDomain' } },
  { key = '%', mods = 'SHIFT|CTRL', action = act.SplitHorizontal{ domain =  'CurrentPaneDomain' } },
  { key = 'h', mods = 'SHIFT|ALT', action = act.ActivatePaneDirection 'Left' },
  { key = 'l', mods = 'SHIFT|ALT', action = act.ActivatePaneDirection 'Right' },
  { key = 'k', mods = 'SHIFT|ALT', action = act.ActivatePaneDirection 'Up' },
  { key = 'j', mods = 'SHIFT|ALT', action = act.ActivatePaneDirection 'Down' },
  { key = 'LeftArrow', mods = 'SHIFT|ALT', action = act.AdjustPaneSize{ 'Left', 1 } },
  { key = 'RightArrow', mods = 'SHIFT|ALT', action = act.AdjustPaneSize{ 'Right', 1 } },
  { key = 'UpArrow', mods = 'SHIFT|ALT', action = act.AdjustPaneSize{ 'Up', 1 } },
  { key = 'DownArrow', mods = 'SHIFT|ALT', action = act.AdjustPaneSize{ 'Down', 1 } },
  -- TABS
  { key = 'Tab', mods = 'CTRL', action = act.ActivateTabRelative(1) },
  { key = 'Tab', mods = 'SHIFT|CTRL', action = act.ActivateTabRelative(-1) },
  { key = '}', mods = 'SHIFT|CTRL', action = act.ActivateTabRelative(1) },
  { key = '{', mods = 'SHIFT|CTRL', action = act.ActivateTabRelative(-1) },
  { key = '1', mods = 'SHIFT|CTRL', action = act.ActivateTab(0) },
  { key = '2', mods = 'SHIFT|CTRL', action = act.ActivateTab(1) },
  { key = '3', mods = 'SHIFT|CTRL', action = act.ActivateTab(2) },
  { key = '4', mods = 'SHIFT|CTRL', action = act.ActivateTab(3) },
  { key = '5', mods = 'SHIFT|CTRL', action = act.ActivateTab(4) },
  { key = '6', mods = 'SHIFT|CTRL', action = act.ActivateTab(5) },
  { key = '7', mods = 'SHIFT|CTRL', action = act.ActivateTab(6) },
  { key = '8', mods = 'SHIFT|CTRL', action = act.ActivateTab(7) },
  { key = '9', mods = 'SHIFT|CTRL', action = act.ActivateTab(-1) },
  { key = 'PageUp', mods = 'SHIFT|CTRL', action = act.MoveTabRelative(-1) },
  { key = 'PageDown', mods = 'SHIFT|CTRL', action = act.MoveTabRelative(1) },
  -- FONT SIZE
  { key = '=', mods = 'CTRL', action = act.IncreaseFontSize },
  { key = '-', mods = 'CTRL', action = act.DecreaseFontSize },
  { key = '0', mods = 'CTRL', action = act.ResetFontSize },
  -- MISC
  { key = 'c', mods = 'SHIFT|CTRL', action = act.CopyTo 'Clipboard' },
  { key = 'f', mods = 'SHIFT|CTRL', action = act.Search 'CurrentSelectionOrEmptyString' },
  { key = 'k', mods = 'SHIFT|CTRL', action = act.ClearScrollback 'ScrollbackOnly' },
  { key = 'l', mods = 'SHIFT|CTRL', action = act.ShowDebugOverlay },
  { key = 'm', mods = 'SHIFT|CTRL', action = act.Hide },
  { key = 'n', mods = 'SHIFT|CTRL', action = act.SpawnWindow },
  { key = 'p', mods = 'SHIFT|CTRL', action = act.ActivateCommandPalette },
  { key = 'r', mods = 'SHIFT|CTRL', action = act.ReloadConfiguration },
  { key = 't', mods = 'SHIFT|CTRL', action = act.SpawnTab 'CurrentPaneDomain' },
  { key = 'u', mods = 'SHIFT|CTRL', action = act.CharSelect{ copy_on_select = true, copy_to =  'ClipboardAndPrimarySelection' } },
  { key = 'v', mods = 'SHIFT|CTRL', action = act.PasteFrom 'Clipboard' },
  { key = 'w', mods = 'SHIFT|CTRL', action = act.CloseCurrentTab{ confirm = true } },
  { key = 'x', mods = 'SHIFT|CTRL', action = act.ActivateCopyMode },
  { key = 'z', mods = 'SHIFT|CTRL', action = act.TogglePaneZoomState },
  { key = 'phys:Space', mods = 'SHIFT|CTRL', action = act.QuickSelect },
  -- WORKSPACES
  { key = 'o', mods = 'CTRL|SHIFT', action = act.PromptInputLine {
      description = wezterm.format {
        { Attribute = { Intensity = 'Bold' } },
        { Foreground = { AnsiColor = 'Fuchsia' } },
        { Text = 'Enter name for new workspace' },
      },
      action = wezterm.action_callback(function(window, pane, line)
        -- line will be `nil` if they hit escape without entering anything
        -- An empty string if they just hit enter
        -- Or the actual line of text they wrote
        if line then
          window:perform_action( act.SwitchToWorkspace { name = line }, pane )
        end
      end),
    },
  },
  { key = 's', mods = 'SHIFT|CTRL', action = act.ShowLauncherArgs{ flags = 'FUZZY|WORKSPACES' } },
  -- COPY MODE
  -- { key = 'Tab', mods = 'NONE', action = act.CopyMode 'MoveForwardWord' },
  -- { key = 'Tab', mods = 'SHIFT', action = act.CopyMode 'MoveBackwardWord' },
  -- { key = 'Enter', mods = 'NONE', action = act.CopyMode 'MoveToStartOfNextLine' },
  -- { key = 'Escape', mods = 'NONE', action = act.Multiple{ 'ScrollToBottom', { CopyMode =  'Close' } } },
  -- { key = 'Space', mods = 'NONE', action = act.CopyMode{ SetSelectionMode =  'Cell' } },
  -- { key = '$', mods = 'NONE', action = act.CopyMode 'MoveToEndOfLineContent' },
  -- { key = '$', mods = 'SHIFT', action = act.CopyMode 'MoveToEndOfLineContent' },
  -- { key = ',', mods = 'NONE', action = act.CopyMode 'JumpReverse' },
  -- { key = '0', mods = 'NONE', action = act.CopyMode 'MoveToStartOfLine' },
  -- { key = ';', mods = 'NONE', action = act.CopyMode 'JumpAgain' },
  -- { key = 'F', mods = 'NONE', action = act.CopyMode{ JumpBackward = { prev_char = false } } },
  -- { key = 'F', mods = 'SHIFT', action = act.CopyMode{ JumpBackward = { prev_char = false } } },
  -- { key = 'G', mods = 'NONE', action = act.CopyMode 'MoveToScrollbackBottom' },
  -- { key = 'G', mods = 'SHIFT', action = act.CopyMode 'MoveToScrollbackBottom' },
  -- { key = 'H', mods = 'NONE', action = act.CopyMode 'MoveToViewportTop' },
  -- { key = 'H', mods = 'SHIFT', action = act.CopyMode 'MoveToViewportTop' },
  -- { key = 'L', mods = 'NONE', action = act.CopyMode 'MoveToViewportBottom' },
  -- { key = 'L', mods = 'SHIFT', action = act.CopyMode 'MoveToViewportBottom' },
  -- { key = 'M', mods = 'NONE', action = act.CopyMode 'MoveToViewportMiddle' },
  -- { key = 'M', mods = 'SHIFT', action = act.CopyMode 'MoveToViewportMiddle' },
  -- { key = 'O', mods = 'NONE', action = act.CopyMode 'MoveToSelectionOtherEndHoriz' },
  -- { key = 'O', mods = 'SHIFT', action = act.CopyMode 'MoveToSelectionOtherEndHoriz' },
  -- { key = 'T', mods = 'NONE', action = act.CopyMode{ JumpBackward = { prev_char = true } } },
  -- { key = 'T', mods = 'SHIFT', action = act.CopyMode{ JumpBackward = { prev_char = true } } },
  -- { key = 'V', mods = 'NONE', action = act.CopyMode{ SetSelectionMode =  'Line' } },
  -- { key = 'V', mods = 'SHIFT', action = act.CopyMode{ SetSelectionMode =  'Line' } },
  -- { key = '^', mods = 'NONE', action = act.CopyMode 'MoveToStartOfLineContent' },
  -- { key = '^', mods = 'SHIFT', action = act.CopyMode 'MoveToStartOfLineContent' },
  -- { key = 'b', mods = 'NONE', action = act.CopyMode 'MoveBackwardWord' },
  -- { key = 'b', mods = 'ALT', action = act.CopyMode 'MoveBackwardWord' },
  -- { key = 'b', mods = 'CTRL', action = act.CopyMode 'PageUp' },
  -- { key = 'c', mods = 'CTRL', action = act.Multiple{ 'ScrollToBottom', { CopyMode =  'Close' } } },
  -- { key = 'd', mods = 'CTRL', action = act.CopyMode{ MoveByPage = (0.5) } },
  -- { key = 'e', mods = 'NONE', action = act.CopyMode 'MoveForwardWordEnd' },
  -- { key = 'f', mods = 'NONE', action = act.CopyMode{ JumpForward = { prev_char = false } } },
  -- { key = 'f', mods = 'ALT', action = act.CopyMode 'MoveForwardWord' },
  -- { key = 'f', mods = 'CTRL', action = act.CopyMode 'PageDown' },
  -- { key = 'g', mods = 'NONE', action = act.CopyMode 'MoveToScrollbackTop' },
  -- { key = 'g', mods = 'CTRL', action = act.Multiple{ 'ScrollToBottom', { CopyMode =  'Close' } } },
  -- { key = 'h', mods = 'NONE', action = act.CopyMode 'MoveLeft' },
  -- { key = 'j', mods = 'NONE', action = act.CopyMode 'MoveDown' },
  -- { key = 'k', mods = 'NONE', action = act.CopyMode 'MoveUp' },
  -- { key = 'l', mods = 'NONE', action = act.CopyMode 'MoveRight' },
  -- { key = 'm', mods = 'ALT', action = act.CopyMode 'MoveToStartOfLineContent' },
  -- { key = 'o', mods = 'NONE', action = act.CopyMode 'MoveToSelectionOtherEnd' },
  -- { key = 'q', mods = 'NONE', action = act.Multiple{ 'ScrollToBottom', { CopyMode =  'Close' } } },
  -- { key = 't', mods = 'NONE', action = act.CopyMode{ JumpForward = { prev_char = true } } },
  -- { key = 'u', mods = 'CTRL', action = act.CopyMode{ MoveByPage = (-0.5) } },
  -- { key = 'v', mods = 'NONE', action = act.CopyMode{ SetSelectionMode =  'Cell' } },
  -- { key = 'v', mods = 'CTRL', action = act.CopyMode{ SetSelectionMode =  'Block' } },
  -- { key = 'w', mods = 'NONE', action = act.CopyMode 'MoveForwardWord' },
  -- { key = 'y', mods = 'NONE', action = act.Multiple{ { CopyTo =  'ClipboardAndPrimarySelection' }, { Multiple = { 'ScrollToBottom', { CopyMode =  'Close' } } } } },
  -- { key = 'PageUp', mods = 'NONE', action = act.CopyMode 'PageUp' },
  -- { key = 'PageDown', mods = 'NONE', action = act.CopyMode 'PageDown' },
  -- { key = 'End', mods = 'NONE', action = act.CopyMode 'MoveToEndOfLineContent' },
  -- { key = 'Home', mods = 'NONE', action = act.CopyMode 'MoveToStartOfLine' },
  -- { key = 'LeftArrow', mods = 'NONE', action = act.CopyMode 'MoveLeft' },
  -- { key = 'LeftArrow', mods = 'ALT', action = act.CopyMode 'MoveBackwardWord' },
  -- { key = 'RightArrow', mods = 'NONE', action = act.CopyMode 'MoveRight' },
  -- { key = 'RightArrow', mods = 'ALT', action = act.CopyMode 'MoveForwardWord' },
  -- { key = 'UpArrow', mods = 'NONE', action = act.CopyMode 'MoveUp' },
  -- { key = 'DownArrow', mods = 'NONE', action = act.CopyMode 'MoveDown' },
  -- SEARCH MODE
  -- { key = 'Enter', mods = 'NONE', action = act.CopyMode 'PriorMatch' },
  -- { key = 'Escape', mods = 'NONE', action = act.CopyMode 'Close' },
  -- { key = 'n', mods = 'CTRL', action = act.CopyMode 'NextMatch' },
  -- { key = 'p', mods = 'CTRL', action = act.CopyMode 'PriorMatch' },
  -- { key = 'r', mods = 'CTRL', action = act.CopyMode 'CycleMatchType' },
  -- { key = 'u', mods = 'CTRL', action = act.CopyMode 'ClearPattern' },
  -- { key = 'PageUp', mods = 'NONE', action = act.CopyMode 'PriorMatchPage' },
  -- { key = 'PageDown', mods = 'NONE', action = act.CopyMode 'NextMatchPage' },
  -- { key = 'UpArrow', mods = 'NONE', action = act.CopyMode 'PriorMatch' },
  -- { key = 'DownArrow', mods = 'NONE', action = act.CopyMode 'NextMatch' },
}

return config
