local sumneko_root_path = vim.fn.expand("~/.applications/lua-language-server")
local sumneko_binary = sumneko_root_path .. "/bin/lua-language-server"

local util = require("lspconfig.util")

local root_files = {
	".luarc.json",
	".luacheckrc",
	".stylua.toml",
	"stylua.toml",
	"selene.toml",
}

return {
	cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
	filetypes = { "lua" },
	root_dir = function(fname)
		return util.root_pattern(unpack(root_files))(fname) or util.find_git_ancestor(fname)
	end,
	single_file_support = true,
	log_level = vim.lsp.protocol.MessageType.Warning,
	settings = {
		Lua = {
			runtime = {
				version = { "LuaJIT", "Lua" },
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					library = vim.api.nvim_get_runtime_file("", true),
				},
			},
			telemetry = {
				enable = false,
			},
		},
	},
}
