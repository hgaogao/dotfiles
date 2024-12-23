-- Pull in the wezterm API
local wezterm = require("wezterm")
local launch_menu = require("launch_menu")

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
	wezterm.log_warn("Failed to load launch_menu.lua. Using default or empty launch_menu.")
	config.launch_menu = {
		-- 可以在这里设置默认的 launch_menu 项
	}
end

-- 设置快捷键
config.keys = {
	--选择左边的tab ctrl + alt + [
	{ key = "[", mods = "CTRL|ALT", action = wezterm.action({ ActivateTabRelative = -1 }) },
	--选择右边的tab ctrl + alt + ]
	{ key = "]", mods = "CTRL|ALT", action = wezterm.action({ ActivateTabRelative = 1 }) },
	-- 选择第一个tab
	{ key = "1", mods = "CTRL|ALT", action = wezterm.action({ ActivateTab = 0 }) },
	-- 选择第二个tab
	{ key = "2", mods = "CTRL|ALT", action = wezterm.action({ ActivateTab = 1 }) },
	-- 选择第三个tab
	{ key = "3", mods = "CTRL|ALT", action = wezterm.action({ ActivateTab = 2 }) },
	-- 选择第四个tab
	{ key = "4", mods = "CTRL|ALT", action = wezterm.action({ ActivateTab = 3 }) },
	-- 选择第五个tab
	{ key = "5", mods = "CTRL|ALT", action = wezterm.action({ ActivateTab = 4 }) },
	-- 选择第六个tab
	{ key = "6", mods = "CTRL|ALT", action = wezterm.action({ ActivateTab = 5 }) },
	-- 切割窗口 ctrl + alt + |
	{ key = "\\", mods = "CTRL|ALT", action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },
	-- 切割窗口 ctrl + alt + -
	{ key = "-", mods = "CTRL|ALT", action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
	--移动光标到左边的pane
	{ key = "h", mods = "CTRL|ALT", action = wezterm.action({ ActivatePaneDirection = "Left" }) },
	--移动光标到右边的pane
	{ key = "l", mods = "CTRL|ALT", action = wezterm.action({ ActivatePaneDirection = "Right" }) },
	--移动光标到上边的pane
	{ key = "k", mods = "CTRL|ALT", action = wezterm.action({ ActivatePaneDirection = "Up" }) },
	--移动光标到下边的pane
	{ key = "j", mods = "CTRL|ALT", action = wezterm.action({ ActivatePaneDirection = "Down" }) },
	--关闭当前pane
	{ key = "q", mods = "CTRL|ALT", action = wezterm.action({ CloseCurrentPane = { confirm = false } }) },
	--关闭当前tab
	{ key = "w", mods = "CTRL|ALT", action = wezterm.action({ CloseCurrentTab = { confirm = false } }) },
	-- 新建一个当前pane的tab
	{ key = "t", mods = "CTRL|ALT", action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }) },
}

return config
