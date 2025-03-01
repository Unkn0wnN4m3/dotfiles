local wezterm = require("wezterm")

local M = {}

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	table.insert(M, {
		label = "Pwsh",
		args = { "pwsh.exe", "-NoLogo" },
	})

	table.insert(M, {
		label = "PowerShell",
		args = { "powershell.exe", "-NoLogo" },
	})

	-- for _, vsvers in ipairs(wezterm.glob("Microsoft Visual Studio/20*", "C:/Program Files (x86)")) do
	-- 	local year = vsvers:gsub("Microsoft Visual Studio/", "")
	-- 	table.insert(M, {
	-- 		label = "x64 Native Tools VS " .. year,
	-- 		args = {
	-- 			"cmd.exe",
	-- 			"/k",
	-- 			"C:/Program Files (x86)/" .. vsvers .. "/BuildTools/VC/Auxiliary/Build/vcvars64.bat",
	-- 		},
	-- 	})
	-- end
end

table.insert(M, {
	label = "Nushell",
	args = { "nu.exe" },
})

return M
