-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config.color_scheme = "Azu (Gogh)"
config.tab_bar_style = {
	window_hide = wezterm.format({
		{ Text = " 😊" },
	}),
	window_maximize = wezterm.format({
		{ Text = " 😄" },
	}),
	window_close = wezterm.format({
		{ Text = " 👋" },
	}),
	window_hide_hover = wezterm.format({
		{ Text = " 🥺" },
	}),
	window_maximize_hover = wezterm.format({
		{ Text = " 😂" },
	}),
	window_close_hover = wezterm.format({
		{ Text = " 😡" },
	}),
}

config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
-- 关闭时不进行确认
config.window_close_confirmation = "NeverPrompt"
config.font = wezterm.font("JetBrains Mono")

-- powershell 7
config.default_prog = { "c:\\Program Files\\PowerShell\\7\\pwsh.exe", "-NoLogo" }
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
-- and finally, return the configuration to wezterm
return config
