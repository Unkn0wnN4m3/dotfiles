local wezterm = require("wezterm")

-- remote plugins
local rose_pine = wezterm.plugin.require("https://github.com/neapsix/wezterm")
local catppuccin = wezterm.plugin.require("https://github.com/catppuccin/wezterm")

local M = {}

function M.apply_to_config(config)
	local appearance = wezterm.gui.get_appearance()
	local color_scheme = os.getenv("NVIM_THEME") or "catppuccin"

	local is_dark = appearance:find("Dark")
	local background = is_dark and "dark" or "light"

	local catppuccin_variant = is_dark and "macchiato" or "latte"
	local rose_pine_variant = is_dark and "moon" or "dawn"

	if color_scheme == "rose-pine" then
		config.colors = rose_pine[rose_pine_variant].colors()
		config.window_frame = rose_pine[rose_pine_variant].window_frame()
	else
		catppuccin.apply_to_config(config, {
			sync = false,
			flavor = catppuccin_variant,
		})
	end

	config.set_environment_variables = {
		NVIM_BACKGROUND = background,
	}

	return config
end

return M
