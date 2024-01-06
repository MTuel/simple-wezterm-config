;; Pull in the Wezterm API.
(local wezterm (require :wezterm))

;; Create a table to hold the configuration.
(local config (wezterm.config_builder))

;; Configure theme and visuals.
(set config.color_scheme "Gruvbox Dark (Gogh)")
(set config.font (wezterm.font_with_fallback ["CaskaydiaCove Nerd Font Mono"]))
(set config.font_size 10)
(set config.use_fancy_tab_bar false)

;; Detect the current OS and set the default shell to PowerShell.
(set config.default_prog
  (if (= wezterm.target_triple "x86_64_pc-windows-msvc") 
        ["C:\\\\Program Files\\PowerShell\\7\\pwsh.exe"]
        (= wezterm.target_triple "x86_64-apple-darwin")
        ["/usr/local/microsoft/powershell/7/pwsh"]
	(= wezterm.target_triple "x86_64-unknown-linux-gnu")
	["/opt/microsoft/powershell/7/pwsh"] ))

;; Set the Leader Key to CTRL+Z.
(set config.leader {:key "z" 
                    :mods "CTRL" 
                    :timeout_milliseconds 2000})

(set config.keys [
     ;; Creating & Closing Panes
    {:key "s"
     :mods "LEADER"
     :action wezterm.action.SplitVertical}
    {:key "v"
     :mods "LEADER"
     :action wezterm.action.SplitHorizontal}
    {:key "w"
     :mods "LEADER"
     :action (wezterm.action.CloseCurrentPane { "confirm" true})}

    ;; Navigating Panes
    {:key "h"
     :mods "LEADER"
     :action (wezterm.action.ActivatePaneDirection "Left")}
    {:key "j"
     :mods "LEADER"
     :action (wezterm.action.ActivatePaneDirection "Down")}
    {:key "k"
     :mods "LEADER"
     :action (wezterm.action.ActivatePaneDirection "Up")}
    {:key "l"
     :mods "LEADER"
     :action (wezterm.action.ActivatePaneDirection "Right")}

    ;; Creating & Closing Tabs
    {:key "n"
     :mods "LEADER"
     :action (wezterm.action.SpawnTab "CurrentPaneDomain")}
    {:key "q"
     :mods "LEADER"
     :action (wezterm.action.CloseCurrentTab { "confirm" true })}
    {:key "t"
     :mods "LEADER"
     :action (wezterm.action.ActivateTabRelative 1)}
    {:key "t"
     :mods "LEADER|SHIFT"
     :action (wezterm.action.ActivateTabRelative -1)}])

;; Finally, return the configuration to Wezterm.
config
