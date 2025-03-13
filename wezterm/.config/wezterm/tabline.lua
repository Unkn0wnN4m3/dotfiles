local wezterm = require("wezterm")
local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")

local M = {}

function M.apply_to_config(config)
	config.tab_bar_at_bottom = false

	local opts = {
		options = {
			-- theme = "rose-pine-dawn",
			theme = config.color_scheme,
			section_separators = {
				left = " ",
				right = " ",
			},
			component_separators = {
				left = " ",
				right = " ",
			},
			tab_separators = {
				left = "|",
				right = "|",
			},
		},
		sections = {
			-- tabline_a = { "mode" },
			-- tabline_b = { "workspace" },
			tabline_a = { "workspace" },
			tabline_b = {},
			tabline_c = { " " },
			tab_active = {
				"index",
				{ "parent", padding = 0 },
				"/",
				{ "cwd", padding = { left = 0, right = 1 } },
				{ "zoomed", padding = 0 },
			},
			tab_inactive = { "index", { "process", padding = { left = 0, right = 1 } } },
			tabline_x = {},
			tabline_y = { "datetime" },
			tabline_z = { "domain" },
		},
	}

	tabline.setup(opts)

	tabline.apply_to_config(config)

	return config
end

return M
