local wezterm = require("wezterm")

local M = {}

function M.apply_to_config(config)
	local appearance = wezterm.gui.get_appearance()
	local color_scheme = os.getenv("NVIM_THEME") or "catppuccin"

	local is_dark = appearance:find("Dark")
	local background = is_dark and "dark" or "light"

	local catppuccin = is_dark and "Catppuccin Macchiato" or "Catppuccin Latte"
	local rose_pine = is_dark and "rose-pine-moon" or "rose-pine-dawn"
	local solarized = is_dark and "Solarized (dark) (terminal.sexy)" or "Solarized (light) (terminal.sexy)"

	if color_scheme == "solarized-osaka" then
		config.color_scheme = solarized
	elseif color_scheme == "rose-pine" then
		config.color_scheme = rose_pine
	else
		config.color_scheme = catppuccin
	end

	config.set_environment_variables = {
		NVIM_BACKGROUND = background,
	}

	return config
end

return M
