local wezterm = require("wezterm")
local act = wezterm.action

return {
	{ key = "mapped:V", mods = "CTRL", action = act.PasteFrom("Clipboard") },
	{ key = "mapped:C", mods = "CTRL", action = wezterm.action.CopyTo("ClipboardAndPrimarySelection") },
	{ key = "-", mods = "CTRL", action = wezterm.action.DecreaseFontSize },
	{ key = "=", mods = "CTRL", action = wezterm.action.IncreaseFontSize },
	{ key = "0", mods = "CTRL", action = wezterm.action.ResetFontSize },
	{ key = "mapped:l", mods = "ALT", action = wezterm.action.ShowLauncher },
	{
		key = "mapped:c",
		mods = "LEADER",
		action = act.SpawnTab("CurrentPaneDomain"),
	},
	{
		key = "mapped:&",
		mods = "LEADER|SHIFT",
		action = act.CloseCurrentTab({ confirm = true }),
	},
	{ key = "mapped:p", mods = "LEADER", action = act.ActivateTabRelative(-1) },
	{ key = "mapped:n", mods = "LEADER", action = act.ActivateTabRelative(1) },
	{
		key = "mapped:|",
		mods = "LEADER|SHIFT",
		action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "mapped:_",
		mods = "LEADER|SHIFT",
		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "mapped:x",
		mods = "LEADER",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
	{
		key = "mapped:H",
		mods = "LEADER",
		action = act.AdjustPaneSize({ "Left", 5 }),
	},
	{
		key = "mapped:J",
		mods = "LEADER",
		action = act.AdjustPaneSize({ "Down", 5 }),
	},
	{ key = "mapped:K", mods = "LEADER", action = act.AdjustPaneSize({ "Up", 5 }) },
	{
		key = "mapped:L",
		mods = "LEADER",
		action = act.AdjustPaneSize({ "Right", 5 }),
	},
	{
		key = "mapped:h",
		mods = "LEADER",
		action = act.ActivatePaneDirection("Left"),
	},
	{
		key = "mapped:l",
		mods = "LEADER",
		action = act.ActivatePaneDirection("Right"),
	},
	{
		key = "mapped:k",
		mods = "LEADER",
		action = act.ActivatePaneDirection("Up"),
	},
	{
		key = "mapped:j",
		mods = "LEADER",
		action = act.ActivatePaneDirection("Down"),
	},
	{
		key = "mapped:z",
		mods = "LEADER",
		action = wezterm.action.TogglePaneZoomState,
	},
	{
		key = "mapped:n",
		mods = "SHIFT|CTRL",
		action = wezterm.action.ToggleFullScreen,
	},
	{
		key = "[",
		mods = "LEADER",
		action = wezterm.action.ActivateCopyMode,
	},
	{
		key = "mapped:b",
		mods = "LEADER|CTRL",
		action = act.SendKey({ key = "b", mods = "CTRL" }),
	},
}
