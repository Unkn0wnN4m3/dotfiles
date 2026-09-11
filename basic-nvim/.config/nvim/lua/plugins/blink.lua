return {
    {
        "saghen/blink.cmp",
        event = { "InsertEnter", "CmdlineEnter" },
        dependencies = {
            "rafamadriz/friendly-snippets",
            "disrupted/blink-cmp-conventional-commits",
            "ribru17/blink-cmp-spell",
            -- "fang2hou/blink-copilot",
        },
        version = "1.*",
        opts = function()
            local capabilities = vim.lsp.protocol.make_client_capabilities()

            capabilities = vim.tbl_deep_extend(
                "force",
                capabilities,
                require("blink.cmp").get_lsp_capabilities({}, false)
            )

            vim.lsp.config("*", {
                capabilities = capabilities,
            })

            return {
                keymap = { preset = "default" },
                appearance = {
                    nerd_font_variant = "mono",
                },
                completion = {
                    documentation = { auto_show = false },
                },
                sources = {
                    default = { "lsp", "path", "snippets", "buffer" },
                    per_filetype = {
                        gitcommit = { "conventional_commits", "spell" },
                        markdown = { "lsp", "spell", "path" },
                        typst = { "lsp", "spell", "path" },
                    },
                    providers = {
                        conventional_commits = {
                            name = "Conventional Commits",
                            module = "blink-cmp-conventional-commits",
                            opts = {},
                        },
                        spell = {
                            name = "Spell",
                            module = "blink-cmp-spell",
                            opts = {
                                use_cmp_spell_sorting = true,
                            },
                        },
                        -- copilot = {
                        --     name = "copilot",
                        --     module = "blink-copilot",
                        --     opts = {
                        --         debounce = 1000,
                        --     },
                        -- },
                    },
                },
                signature = { enabled = true, trigger = { enabled = true } },
            }
        end,
        opts_extend = { "sources.default" },
    },
}
