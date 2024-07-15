return {
	{ "nvim-tree/nvim-web-devicons", lazy = true },
	{
		"nvim-lualine/lualine.nvim",
		event = "VimEnter",
		opts = function()
			local function mixedIndent()
				local space_indent = vim.fn.search([[\v^ +]], "nw") > 0
				local tab_indent = vim.fn.search([[\v^\t+]], "nw") > 0
				local mixed = (space_indent and tab_indent) or (vim.fn.search([[\v^(\t+ | +\t)]], "nw") > 0)
				return mixed and "MI" or ""
			end

			local function showIndent()
				local width = vim.o.shiftwidth
				if vim.o.expandtab then
					return "spc: " .. width
				else
					return "tab: " .. width
				end
			end

			local opts = {
				options = {
					section_separators = "",
					component_separators = "",
					icons_enabled = false,
					disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
				},
				sections = {
					lualine_c = {
						{ mixedIndent, color = "red" },
						{ "buffers", mode = 4 },
					},
					lualine_x = {
						showIndent,
						"fileformat",
						"filetype",
					},
				},
				tabline = {
					lualine_z = { { "tabs", mode = 0 } },
				},
				extensions = {
					"quickfix",
					"toggleterm",
					"man",
					"fugitive",
					"lazy",
					"trouble",
					"mason",
					"nvim-dap-ui",
				},
			}

			return opts
		end,
	},
	{
		"b0o/incline.nvim",
		event = "BufReadPre",
		config = function()
			local devicons = require("nvim-web-devicons")
			local incline = require("incline")
			incline.setup({
				window = {
					padding = 0,
					margin = { horizontal = 0 },
				},
				render = function(props)
					local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
					if filename == "" then
						filename = "[No Name]"
					end
					local ft_icon, ft_color = devicons.get_icon_color(filename)
					local modified = vim.bo[props.buf].modified
					return {
						ft_icon and { " ", ft_icon, " ", guifg = ft_color } or "",
						{ filename, gui = modified and "bold,italic" or "bold" },
					}
				end,
			})

			vim.api.nvim_create_user_command("InclineToggle", function()
				require("incline").toggle()
			end, {})
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "VeryLazy",
		main = "ibl",
		opts = {
			indent = {
				char = "│",
				tab_char = "│",
			},
			scope = { show_start = false, show_end = false },
			exclude = {
				filetypes = {
					"help",
					"alpha",
					"dashboard",
					"neo-tree",
					"Trouble",
					"trouble",
					"lazy",
					"mason",
					"notify",
					"toggleterm",
					"lazyterm",
				},
			},
		},
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		config = function()
			local wk = require("which-key")
			wk.add({
				{
					mode = { "n", "v" },
					{ "g", group = "+goto" },
					{ "gs", group = "+surround" },
					{ "z", group = "+fold" },
					{ "]", group = "+next" },
					{ "[", group = "+prev" },
					{ "<leader>q", group = "+quit/session" },
					{ "<leader>g", group = "+git" },
					{ "<leader>gh", group = "+hunks" },
					{ "<leader>x", group = "+diagnostics/quickfix" },
					{ "<leader>s", group = "+search" },
					{ "<leader>f", group = "+file/find" },
					{ "<leader>w", group = "+windows" },
					{ "<leader>u", group = "+ui" },
					{ "<leader>b", group = "+buffer" },
					{ "<leader><tab>", group = "+tabs" },
				},
			})
		end,
	},
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
		"prichrd/netrw.nvim",
		config = true,
		event = "VeryLazy",
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			presets = {
				bottom_search = true,
				-- command_palette = true,
				long_message_to_split = true,
				inc_rename = false,
				lsp_doc_border = true,
			},
			messages = { enabled = false },
			routes = {
				{
					filter = {
						event = "notify",
						find = "No information available",
					},
					opts = { skip = true },
				},
			},
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
			{
				"rcarriga/nvim-notify",
				opts = {
					background_colour = "#000000",
					timeout = 15000,
				},
			},
		},
	},
	{
		"nvimdev/dashboard-nvim",
		lazy = false, -- As https://github.com/nvimdev/dashboard-nvim/pull/450, dashboard-nvim shouldn't be lazy-loaded to properly handle stdin.
		event = "VimEnter",
		opts = function()
			local logo = [[
      888   |      e      888  /        e    e       e88~-_  888   | 888b    |
      888___|     d8b     888 /        d8b  d8b     d888   \ 888___| |Y88b   |
      888   |    /Y88b    888/\       d888bdY88b    8888     888   | | Y88b  |
      888   |   /  Y88b   888  \     / Y88Y Y888b   8888     888   | |  Y88b |
      888   |  /____Y88b  888   \   /   YY   Y888b  Y888   / 888   | |   Y88b|
      888   | /      Y88b 888    \ /          Y888b  "88_-~  888   | |    Y888
    ]]

			logo = string.rep("\n", 8) .. logo .. "\n\n"

			local opts = {
				theme = "doom",
				hide = {
					-- this is taken care of by lualine
					-- enabling this messes up the actual laststatus setting after loading a file
					statusline = false,
				},
				config = {
					header = vim.split(logo, "\n"),
          -- stylua: ignore
          center = {
            { action = 'Telescope find_files', desc = " Find File", icon = " ", key = "f" },
            { action = "ene | startinsert", desc = " New File", icon = " ", key = "n" },
            { action = 'Telescope oldfiles', desc = " Recent Files", icon = " ", key = "r" },
            { action = 'lua require("persistence").load()', desc = " Restore Session", icon = " ", key = "s" },
            { action = "Lazy", desc = " Lazy", icon = "󰒲 ", key = "l" },
            { action = function() vim.api.nvim_input("<cmd>qa<cr>") end, desc = " Quit", icon = " ", key = "q" },
          },
					footer = function()
						local stats = require("lazy").stats()
						local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
						return {
							"⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms",
						}
					end,
				},
			}

			for _, button in ipairs(opts.config.center) do
				button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
				button.key_format = "  %s"
			end

			-- close Lazy and re-open when the dashboard is ready
			if vim.o.filetype == "lazy" then
				vim.cmd.close()
				vim.api.nvim_create_autocmd("User", {
					pattern = "DashboardLoaded",
					callback = function()
						require("lazy").show()
					end,
				})
			end

			return opts
		end,
	},
}
