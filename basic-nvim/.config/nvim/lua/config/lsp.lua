local languages = { "tinymist", "lua_ls", "copilot" }

vim.diagnostic.config(
    {
        virtual_text = true,
        severity_sort = true,
        jump = { float = true },
    }
)

vim.lsp.config[languages[1]] = {
    cmd = { "tinymist" },
    filetypes = { "typst" },
    settings = {
        exportPdf = "never",
        formatterMode = "typstyle",
        formatterProseWrap = true,
        formatterPrintWidth = 80,
        formatterIndentSize = 4,
    }
}

vim.lsp.config[languages[2]] = {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git', "stylua.toml", ".stylua.toml" },
    settings = {
        runtime = {
            version = 'LuaJIT',
            path = { 'lua/?.lua', 'lua/?/init.lua' },
        },
        diagnostics = {
            globals = { 'vim' },
        },
        telemetry = {
            enable = false,
        },
        workspace = {
            checkThirdParty = false,
            library = {
                vim.env.VIMRUNTIME,
            },
        },
    }
}

vim.lsp.config[languages[3]] = {
    cmd = { 'copilot-language-server', '--stdio' },
    root_markers = { '.git' },
    init_options = {
        editorInfo = {
            name = 'Neovim', version = tostring(vim.version()) },
        editorPluginInfo = { name = 'Neovim', version = tostring(vim.version()) },
    },
    settings = {
        telemetry = {
            telemetryLevel = 'off',
        },
    },
}

vim.lsp.enable(languages)
