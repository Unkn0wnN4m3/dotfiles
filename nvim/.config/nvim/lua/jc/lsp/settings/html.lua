local util = require("lspconfig.util")

local bin_name = "vscode-html-language-server"
local cmd = { bin_name, "--stdio" }

return {
	cmd = cmd,
	filetypes = { "html" },
	root_dir = util.root_pattern("package.json", ".git"),
	single_file_support = true,
	settings = {},
	init_options = {
		provideFormatter = false,
		embeddedLanguages = { css = true, javascript = true },
		configurationSection = { "html", "css", "javascript" },
	},
}
