local wezterm = require("wezterm")

local M = {}

function M.get_appearance()
	if wezterm.gui then
		local appearance = wezterm.gui.get_appearance()
		return appearance
	end
	return "Dark"
end

return M
