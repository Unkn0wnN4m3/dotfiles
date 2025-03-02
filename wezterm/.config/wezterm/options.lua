local wezterm = require("wezterm")
local helper_functions = require("helper_functions")

local M = {}

function M.apply_to_config(config)
	-- Basic configuration

	if wezterm.target_triple == "x86_64-pc-windows-msvc" then
		config.default_prog = { "pwsh.exe", "-NoLogo" }
	end

	local appearance = helper_functions.get_appearance()

	if appearance:find("Dark") then
		config.color_scheme = "Catppuccin Macchiato"
		config.set_environment_variables = {
			NVIM_BACKGROUND = "dark",
		}
	else
		config.color_scheme = "Catppuccin Latte"
		config.set_environment_variables = {
			NVIM_BACKGROUND = "light",
		}
	end

	config.font = wezterm.font_with_fallback({
		"Maple Mono NF",
		"JetBrainsMono Nerd Font Mono",
		"Consolas",
	})
	config.font_size = 12
	config.text_background_opacity = 1.0
	config.initial_cols = 120
	config.initial_rows = 30
	config.default_cursor_style = "BlinkingBar"
	config.disable_default_key_bindings = true
	config.use_fancy_tab_bar = false
	config.tab_bar_at_bottom = true
	config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
	config.adjust_window_size_when_changing_font_size = false
	config.enable_kitty_graphics = true
	-- config.window_background_image = wezterm.home_dir .. "/.config/wezterm/background.png"
	-- config.window_background_image_hsb = {
	-- 	brightness = 0.1,
	-- }

	return config
end

return M
