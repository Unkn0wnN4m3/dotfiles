local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
	ensure_installed = {
		"json",
		"yaml",
		"dockerfile",
		"bash",
		"fish",
		"html",
		"css",
		"scss",
		"javascript",
		"typescript",
		"tsx",
		"vue",
		"java",
		"vim",
		"lua",
		"python",
		"c",
		"go",
		"comment",
		"markdown",
		"embedded_template",
	},
	highlight = {
		enable = true,
		disable = {},
	},
	refactor = {
		highlight_definitions = { enable = true },
		highlight_current_scope = { enable = false },
		smart_rename = {
			enable = true,
			keymaps = {
				smart_rename = "grr",
			},
		},
		navigation = {
			enable = true,
			keymaps = {
				goto_next_usage = "<a-n>",
				goto_previous_usage = "<a-p>",
			},
		},
	},
	autotag = {
		enable = true,
		disable = {},
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
	rainbow = {
		enable = true,
		extended_mode = false, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
	},
})
