local wezterm = require("wezterm")

-- remote plugins
local rose_pine = wezterm.plugin.require("https://github.com/neapsix/wezterm")
local catppuccin = wezterm.plugin.require("https://github.com/catppuccin/wezterm")

local appearance = wezterm.gui.get_appearance()

local color_scheme = os.getenv("NVIM_THEME") or "catppuccin"

local M = {}

function M.apply_to_config(config)
	-- light themes
	if appearance:find("Dark") then
		if color_scheme == "catppuccin" then
			catppuccin.apply_to_config(config, {
				sync = false,
				flavor = "macchiato",
			})
		elseif color_scheme == "rose-pine" then
			config.colors = rose_pine.moon.colors()
			config.window_frame = rose_pine.moon.window_frame()
		end

		config.set_environment_variables = {
			NVIM_BACKGROUND = "dark",
		}

	-- dark themes
	else
		if color_scheme == "catppuccin" then
			catppuccin.apply_to_config(config, {
				sync = false,
				flavor = "latte",
			})
		elseif color_scheme == "rose-pine" then
			config.colors = rose_pine.dawn.colors()
			config.window_frame = rose_pine.dawn.window_frame()
		end

		config.set_environment_variables = {
			NVIM_BACKGROUND = "light",
		}
	end

	return config
end

return M
