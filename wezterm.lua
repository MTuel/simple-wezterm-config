-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.color_scheme = 'OneDark (base16)'

config.font = wezterm.font_with_fallback { 'CaskaydiaCove Nerd Font Mono' }
config.font_size = 10
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

config.colors = {
  tab_bar = {
    background = '#22262d',

    active_tab = {
      bg_color = '#282c34',
      fg_color = '#dcdcdc',
      intensity = 'Bold'
    },

    inactive_tab = {
      bg_color = '#21252B',
      fg_color = '#727780',
      intensity = 'Normal'
    },

    inactive_tab_hover = {
      bg_color = '#21252B',
      fg_color = '#dcdcdc',
      intensity = 'Bold'
    },

    new_tab = {
      bg_color = '#282c34',
      fg_color = '#727780',
      intensity = 'Normal'
    },

    new_tab_hover = {
      bg_color = '#282c34',
      fg_color = '#dcdcdc',
      intensity = 'Bold'
    },
  }
}

config.command_palette_bg_color = '#282c34'
config.command_palette_fg_color = '#dcdcdc'
config.command_palette_font_size = 12


if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
  config.default_prog = { 'C:\\Program Files\\PowerShell\\7\\pwsh.exe' }
end
if(wezterm.target_triple == 'x86_64-apple-darwin') then
  -- Set the default shell with the 'chsh' command on the system.
  config.font_size = 12
end
if(wezterm.target_triple == 'x86_64-unknown-linux-gnu') then
  config.default_prog = { '/opt/microsoft/powershell/7/pwsh' }
end

-- Set the leader key to a key that doesn't conflict with other keybindings.
config.leader = { key = 'z', mods = 'CTRL', timeout_milliseconds = 2000 }

config.keys = {
  -- Creating & Closing Panes
  { key = 's', mods = 'LEADER', action = wezterm.action.SplitVertical },
  { key = 'v', mods = 'LEADER', action = wezterm.action.SplitHorizontal },
  { key = 'w', mods = 'LEADER', action = wezterm.action.CloseCurrentPane { confirm = true } },

  -- Navigating Panes
  { key = 'h', mods = 'LEADER', action = wezterm.action.ActivatePaneDirection 'Left' },
  { key = 'l', mods = 'LEADER', action = wezterm.action.ActivatePaneDirection 'Right' },
  { key = 'k', mods = 'LEADER', action = wezterm.action.ActivatePaneDirection 'Up' },
  { key = 'j', mods = 'LEADER', action = wezterm.action.ActivatePaneDirection 'Down' },

  -- Creating & Closing Tabs
  { key = 'n', mods = 'LEADER', action = wezterm.action.SpawnTab 'CurrentPaneDomain' },
  { key = 'q', mods = 'LEADER', action = wezterm.action.CloseCurrentTab { confirm = true } },

  -- Navigating Tabs
  { key = 't', mods = 'LEADER', action = wezterm.action.ActivateTabRelative(1) },
  { key = 't', mods = 'LEADER|SHIFT', action = wezterm.action.ActivateTabRelative(-1) },

  { key = 'F1', mods = 'LEADER', action = wezterm.action.ActivateTab(0) },
  { key = 'F2', mods = 'LEADER', action = wezterm.action.ActivateTab(1) },
  { key = 'F3', mods = 'LEADER', action = wezterm.action.ActivateTab(2) },
  { key = 'F4', mods = 'LEADER', action = wezterm.action.ActivateTab(3) },
  { key = 'F5', mods = 'LEADER', action = wezterm.action.ActivateTab(4) },
  { key = 'F6', mods = 'LEADER', action = wezterm.action.ActivateTab(5) },
  { key = 'F7', mods = 'LEADER', action = wezterm.action.ActivateTab(6) },
  { key = 'F8', mods = 'LEADER', action = wezterm.action.ActivateTab(7) },
  { key = 'F9', mods = 'LEADER', action = wezterm.action.ActivateTab(8) },
  { key = 'F10', mods = 'LEADER', action = wezterm.action.ActivateTab(9) },
  { key = 'F11', mods = 'LEADER', action = wezterm.action.ActivateTab(10) },
  { key = 'F12', mods = 'LEADER', action = wezterm.action.ActivateTab(11) },
}

-- and finally, return the configuration to wezterm
return config
