local wezterm = require("wezterm")

local M = {}

function M.apply_to_config(config)
	local appearance = wezterm.gui.get_appearance()
	local color_scheme = os.getenv("NVIM_THEME")

	local is_dark = appearance:find("Dark")
	local background = is_dark and "dark" or "light"

	local catppuccin = is_dark and "Catppuccin Macchiato" or "Catppuccin Latte"
	local rose_pine = is_dark and "rose-pine-moon" or "rose-pine-dawn"
	local solarized = is_dark and "Solarized (dark) (terminal.sexy)" or "Solarized (light) (terminal.sexy)"
	local tokyonight = is_dark and "tokyonight_storm" or "tokyonight_day"

	local schemes = {
		["solarized-osaka"] = solarized,
		["rose-pine"] = rose_pine,
		["catppuccin"] = catppuccin,
		["tokyonight"] = tokyonight,
	}

	config.color_scheme = schemes[color_scheme] or catppuccin

	config.set_environment_variables = {
		NVIM_BACKGROUND = background,
	}

	return config
end

return M
