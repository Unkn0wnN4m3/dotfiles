local wezterm = require("wezterm")
local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")

local M = {}

local function leader(window)
	if window:leader_is_active() then
		return " " .. wezterm.nerdfonts.fa_rocket
	else
		return ""
	end
end

function M.apply_to_config(config)
	config.tab_bar_at_bottom = false

	local opts = {
		options = {
			-- theme = "rose-pine-dawn",
			theme = config.color_scheme,
			section_separators = {
				left = "",
				right = "",
			},
			component_separators = {
				left = "",
				right = "",
			},
			tab_separators = {
				left = "|",
				right = "|",
			},
		},
		sections = {
			tabline_a = { leader, "workspace" },
			tabline_b = { "hostname" },
			tabline_c = { " " },
			tab_active = { "index", "tab", { "zoomed", padding = 0 } },
			tab_inactive = { "index", { "process", padding = { left = 0, right = 1 } } },
			tabline_x = { " " },
			tabline_y = { "datetime" },
			tabline_z = { "domain" },
		},
	}

	tabline.setup(opts)

	-- https://github.com/michaelbrusegard/tabline.wez/discussions/3
	tabline.apply_to_config(config)

	return config
end

return M
