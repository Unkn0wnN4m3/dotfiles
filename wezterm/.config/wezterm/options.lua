local wezterm = require("wezterm")

local M = {}

function M.apply_to_config(config)
	-- Basic configuration
	config.automatically_reload_config = true

	if wezterm.target_triple == "x86_64-pc-windows-msvc" then
		config.default_prog = { "pwsh.exe", "-NoLogo" }
	end

	config.font = wezterm.font_with_fallback({
		"Maple Mono NF",
		"JetBrainsMono Nerd Font Mono",
		"Consolas",
	})
	config.font_size = 12
	config.text_background_opacity = 1.0
	config.foreground_text_hsb = {
		hue = 1.0,
		saturation = 1.1,
		brightness = 1.0,
	}
	config.initial_cols = 120
	config.initial_rows = 30
	config.default_cursor_style = "BlinkingBar"
	config.disable_default_key_bindings = true
	config.use_fancy_tab_bar = false
	config.tab_bar_at_bottom = true
	config.leader = { key = "b", mods = "CTRL", timeout_milliseconds = 1000 }
	config.adjust_window_size_when_changing_font_size = false
	config.enable_kitty_graphics = true
	-- config.window_background_opacity = 0.95
	-- config.window_background_image = wezterm.home_dir .. "/.config/wezterm/background.png"
	-- config.window_background_image_hsb = {
	-- 	brightness = 0.1,
	-- }

	return config
end

return M
