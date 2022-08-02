local util = require("lspconfig.util")

return {
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gotmpl" },
	root_dir = function(fname)
		return util.root_pattern("go.work")(fname) or util.root_pattern("go.mod", ".git")(fname)
	end,
	single_file_support = true,
	settings = {
		gopls = {
			hints = {
				assignVariableTypes = true,
				compositeLiteralTypes = true,
				functionTypeParameters = true,
				rangeVariableTypes = true,
			},
			analyses = {
				shadow = true,
				unusedparams = true,
			},
			staticcheck = true,
		},
	},
}
