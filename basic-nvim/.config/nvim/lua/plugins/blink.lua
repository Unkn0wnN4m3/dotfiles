return {
    {
        "saghen/blink.cmp",
        event = { "InsertEnter", "CmdlineEnter" },
        dependencies = { 'rafamadriz/friendly-snippets' },
        version = '1.*',
        config = function()
            local blink = require('blink.cmp')
            blink.setup({
                keymap = { preset = 'default' },
                appearance = {
                    nerd_font_variant = 'mono'
                },
                completion = { documentation = { auto_show = false } },
                sources = {
                    default = { 'lsp', 'path', 'snippets', 'buffer' },
                },
                signature = { enabled = true, trigger = { enabled = true } }
            })

            vim.lsp.config('*', {
                capabilities = blink.get_lsp_capabilities()
            })
        end,
        opts_extend = { "sources.default" }
    }
}
