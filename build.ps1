
Invoke-Expression "./fennel -c fnl/wezterm.fnl" |
	Out-String |
		Set-Content wezterm.lua

