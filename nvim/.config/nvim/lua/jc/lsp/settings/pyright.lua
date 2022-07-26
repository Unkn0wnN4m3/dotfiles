local util = require("lspconfig.util")

local bin_name = "pyright-langserver"
local cmd = { bin_name, "--stdio" }

local root_files = {
	"pyproject.toml",
	"setup.py",
	"setup.cfg",
	"requirements.txt",
	"Pipfile",
	"pyrightconfig.json",
}

return {
	cmd = cmd,
	filetypes = { "python" },
	root_dir = util.root_pattern(unpack(root_files)),
	single_file_support = true,
	settings = {
		python = {
			analysis = {
				typeCheckingMode = "basic",
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
				diagnosticMode = "workspace",
			},
		},
	},
}
