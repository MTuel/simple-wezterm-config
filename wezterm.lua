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

if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
  config.default_prog = { 'C:\\Program Files\\PowerShell\\7\\pwsh.exe' }
end
if(wezterm.target_triple == 'x86_64-apple-darwin') then
  config.default_prog = { '/usr/local/microsoft/powershell/7/pwsh' }
end
if(wezterm.target_triple == 'x86_64-unknown-linux-gnu') then
  config.default_prog = { '/opt/microsoft/powershell/7/pwsh' }
end

config.font = wezterm.font_with_fallback { 'CaskaydiaCove Nerd Font Mono' }
config.font_size = 10
config.use_fancy_tab_bar = false

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
  { key = 't', mods = 'LEADER', action = wezterm.action.ActivateTabRelative(1) },
  { key = 't', mods = 'LEADER|SHIFT', action = wezterm.action.ActivateTabRelative(-1) },
}

-- and finally, return the configuration to wezterm
return config
