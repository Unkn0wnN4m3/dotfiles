return {
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        lazy = true,
        config = false,
    },
    {
        'williamboman/mason.nvim',
        version = "v1.8.*",
        lazy = false,
        config = true,
    },

    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        version = "v0.*",
        event = 'InsertEnter',
        dependencies = {
            {
                'L3MON4D3/LuaSnip',
                version = "v2.0.*"
            },
            {
                'onsails/lspkind.nvim',
                commit = '57610d5ab560c073c465d6faf0c19f200cb67e6e'
            }
        },
        config = function()
            local cmp = require('cmp')
            local cmp_action = require('lsp-zero').cmp_action()

            cmp.setup({
                preselect = 'item',
                completion = {
                    completeopt = 'menu,menuone,noinsert'
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                formatting = {
                    fields = { 'abbr', 'kind', 'menu' },
                    format = require('lspkind').cmp_format({
                        maxwidth = 50,
                        ellipsis_char = '...',
                    })
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-d>'] = cmp.mapping.scroll_docs(4),
                    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
                    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
                })
            })
        end
    },

    -- LSP
    {
        'neovim/nvim-lspconfig',
        cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            {
                'hrsh7th/cmp-nvim-lsp',
                commit = '44b16d11215dce86f253ce0c30949813c0a90765'
            },
            {
                'williamboman/mason-lspconfig.nvim',
                version = 'V1.17.*'
            },
        },
        config = function()
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_lspconfig()

            lsp_zero.on_attach(function(client, bufnr)
                lsp_zero.default_keymaps({ buffer = bufnr })

                if client.server_capabilities["documentSymbolProvider"] then
                    require("nvim-navic").attach(client, bufnr)
                end
            end)

            require('mason-lspconfig').setup({
                ensure_installed = {
                    "pyright",
                    "tsserver",
                    "eslint",
                    "html",
                    "cssls",
                    "jsonls",
                    "marksman",
                    "lua_ls"
                },
                handlers = {
                    lsp_zero.default_setup,
                    lua_ls = function()
                        local lua_opts = lsp_zero.nvim_lua_ls()
                        require("lspconfig").lua_ls.setup(lua_opts)
                    end
                }
            })

            -- clangd manual config
            require("lspconfig").clangd.setup({})
        end,
    }
}
