return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			transparent_background = true, -- disables setting the background color.
			background = { -- :h background
				light = "latte",
				dark = "frappe",
			},
		},
	},
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		opts = {
			transparent_mode = true,
		},
	},
	{
		"EdenEast/nightfox.nvim",
		priority = 1000,
		opts = {
			options = {
				transparent = true,
				inverse = { -- Inverse highlight for different types
					visual = true,
				},
			},
		},
	},
	{
		"mellow-theme/mellow.nvim",
		priority = 1000,
		init = function()
			vim.g.mellow_bold_functions = true
			vim.g.mellow_italic_keywords = true
			vim.g.mellow_italic_booleans = true
			vim.g.mellow_transparent = true
			vim.g.mellow_italic_comments = false
		end,
	},
}
