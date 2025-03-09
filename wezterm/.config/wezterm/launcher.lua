local wezterm = require("wezterm")

local M = {}

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	table.insert(M, {
		label = "New Tab (domain `local` - pwsh)",
		args = { "pwsh.exe", "-NoLogo" },
	})

	table.insert(M, {
		label = "New Tab (domain `local` - Powershell)",
		args = { "powershell.exe", "-NoLogo" },
	})
end

table.insert(M, {
	label = "New Tab (domain `local` - nu)",
	args = { "nu.exe" },
})

return M
