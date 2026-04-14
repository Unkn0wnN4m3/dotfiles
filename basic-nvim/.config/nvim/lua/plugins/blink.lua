return {
    {
        "saghen/blink.cmp",
        event = { "InsertEnter", "CmdlineEnter" },
        dependencies = { "rafamadriz/friendly-snippets" },
        version = "1.*",
        opts = function()
            local capabilities = vim.lsp.protocol.make_client_capabilities()

            capabilities =
                vim.tbl_deep_extend("force", capabilities, require("blink.cmp").get_lsp_capabilities({}, false))
            vim.lsp.config("*", {
                capabilities = capabilities,
            })

            return {
                keymap = { preset = "default" },
                appearance = {
                    nerd_font_variant = "mono",
                },
                completion = { documentation = { auto_show = false } },
                sources = {
                    default = { "lsp", "path", "snippets", "buffer" },
                },
                signature = { enabled = true, trigger = { enabled = true } },
            }
        end,
        opts_extend = { "sources.default" },
    },
}
