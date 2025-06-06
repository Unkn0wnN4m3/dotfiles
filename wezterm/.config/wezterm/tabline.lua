local wezterm = require("wezterm")
local tabline = wezterm.plugin.require(
	"https://github.com/michaelbrusegard/tabline.wez",
	{ ref = "6022b9f9ec68c9a4dd50f40ceba3a7b9b9d1684a" }
)

local M = {}

local function leader(window)
	if window:leader_is_active() then
		return " " .. wezterm.nerdfonts.fa_rocket .. " LDR "
	else
		return ""
	end
end

function M.apply_to_config(config)
	local opts = {
		options = {
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
			tabline_a = { "workspace" },
			tabline_b = { "hostname" },
			tabline_c = { " " },
			tab_active = { "index", "tab", { "zoomed", padding = 0 } },
			tab_inactive = { "index", { "process", padding = { left = 0, right = 1 } } },
			tabline_x = {
				" ",
				{ Foreground = { Color = "White" } },
				{ Background = { AnsiColor = "Purple" } },
				leader,
				"ResetAttributes",
			},
			tabline_y = { "datetime" },
			tabline_z = { "domain" },
		},
	}

	tabline.setup(opts)

	-- https://github.com/michaelbrusegard/tabline.wez/discussions/3
	tabline.apply_to_config(config)

	config.tab_bar_at_bottom = false

	return config
end

return M
