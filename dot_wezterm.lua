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
config.use_fancy_tab_bar = false

-- 设置多启动菜单
local success, launch_menu = pcall(require, "launch_menu")

if success then
	-- 如果成功导入，使用导入的 launch_menu
	config.launch_menu = launch_menu
else
	-- 如果导入失败，可以设置一个默认的 launch_menu 或者不设置
	config.launch_menu = {
		-- 可以在这里设置默认的 launch_menu 项
	}
end
return config
