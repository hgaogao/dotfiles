local launch_menu = {
	{
		label = "Powershell",
		args = { "c:\\Program Files\\PowerShell\\7\\pwsh.exe", "-NoLogo" },
	},
	{
		label = "dev server",
		args = { "ssh", "devServer" },
	},
	{
		label = "test server",
		args = { "ssh", "testServer" },
	},
}

return launch_menu
