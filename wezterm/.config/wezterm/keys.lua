-- From:
-- https://github.com/theopn/dotfiles/blob/main/wezterm/wezterm.lua

local wezterm = require("wezterm")
local act = wezterm.action

local M = {}

function M.apply_to_config(config)
	config.keys = {
		{ key = "mapped::", mods = "LEADER|SHIFT", action = act.ActivateCommandPalette },
		{ key = "mapped:V", mods = "CTRL", action = act.PasteFrom("Clipboard") },
		{ key = "mapped:C", mods = "CTRL", action = act.CopyTo("ClipboardAndPrimarySelection") },
		{ key = "mapped:-", mods = "CTRL", action = act.DecreaseFontSize },
		{ key = "mapped:=", mods = "CTRL", action = act.IncreaseFontSize },
		{ key = "mapped:0", mods = "CTRL", action = act.ResetFontSize },
		{ key = "mapped:l", mods = "ALT", action = act.ShowLauncher },
		{
			key = "mapped:c",
			mods = "LEADER",
			action = act.SpawnTab("CurrentPaneDomain"),
		},
		{ key = "mapped:n", mods = "LEADER", action = act.ShowTabNavigator },
		{
			key = "mapped:&",
			mods = "LEADER|SHIFT",
			action = act.CloseCurrentTab({ confirm = true }),
		},
		{ key = "mapped:[", mods = "LEADER", action = act.ActivateTabRelative(-1) },
		{ key = "mapped:]", mods = "LEADER", action = act.ActivateTabRelative(1) },
		{
			key = "mapped:,",
			mods = "LEADER",
			action = act.PromptInputLine({
				description = wezterm.format({
					{ Attribute = { Intensity = "Bold" } },
					{ Foreground = { AnsiColor = "Fuchsia" } },
					{ Text = "Renaming Tab Title...:" },
				}),
				action = wezterm.action_callback(function(window, _, line)
					if line then
						window:active_tab():set_title(line)
					end
				end),
			}),
		},
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
			action = act.CloseCurrentPane({ confirm = true }),
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
			key = "mapped:r",
			mods = "LEADER",
			action = act.ActivateKeyTable({ name = "resize_pane", one_shot = false }),
		},
		{
			key = "mapped:z",
			mods = "LEADER",
			action = act.TogglePaneZoomState,
		},
		{
			key = "mapped:n",
			mods = "SHIFT|CTRL",
			action = act.ToggleFullScreen,
		},
		{
			key = "y",
			mods = "LEADER",
			action = act.ActivateCopyMode,
		},
		{
			key = "mapped:b",
			mods = "LEADER|CTRL",
			action = act.SendKey({ key = "b", mods = "CTRL" }),
		},
		{
			key = "mapped:C",
			mods = "LEADER",
			action = act.PromptInputLine({
				description = wezterm.format({
					{ Attribute = { Intensity = "Bold" } },
					{ Foreground = { AnsiColor = "Fuchsia" } },
					{ Text = "Enter name for new workspace" },
				}),
				action = wezterm.action_callback(function(window, pane, line)
					-- line will be `nil` if they hit escape without entering anything
					-- An empty string if they just hit enter
					-- Or the actual line of text they wrote
					if line then
						window:perform_action(
							act.SwitchToWorkspace({
								name = line,
							}),
							pane
						)
					end
				end),
			}),
		},
	}

	config.key_tables = {
		resize_pane = {
			{ key = "h", action = act.AdjustPaneSize({ "Left", 1 }) },
			{ key = "j", action = act.AdjustPaneSize({ "Down", 1 }) },
			{ key = "k", action = act.AdjustPaneSize({ "Up", 1 }) },
			{ key = "l", action = act.AdjustPaneSize({ "Right", 1 }) },
			{ key = "Escape", action = "PopKeyTable" },
			{ key = "Enter", action = "PopKeyTable" },
		},
	}

	for i = 1, 9 do
		table.insert(config.keys, {
			key = tostring(i),
			mods = "LEADER",
			action = act.ActivateTab(i - 1),
		})
	end

	return config
end

return M
