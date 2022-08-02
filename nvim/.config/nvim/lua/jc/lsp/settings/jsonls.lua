local util = require("lspconfig.util")

local bin_name = "vscode-json-language-server"
local cmd = { bin_name, "--stdio" }

return {
	cmd = cmd,
	filetypes = { "json", "jsonc" },
	init_options = {
		provideFormatter = false,
	},
	root_dir = util.find_git_ancestor,
	single_file_support = true,
}
