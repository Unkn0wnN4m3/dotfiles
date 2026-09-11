return {
    { "mason-org/mason.nvim", opts = {}, lazy = true },
    {
        "mason-org/mason-lspconfig.nvim",
        lazy = true,
        opts = { automatic_enable = { exclude = { "ruff", "stylua" } } },
    },
    {
        "neovim/nvim-lspconfig",
        lazy = true,
        config = function()
            -- vim.lsp.config("copilot", {
            --     settings = {
            --         telemetry = { telemetryLevel = "off" },
            --     },
            -- })
            vim.lsp.config("tinymist", {
                settings = {
                    formatterMode = "typstyle",
                    formatterProseWrap = true,
                    formatterPrintWidth = 80,
                    formatterIndentSize = 4,
                },
            })
        end,
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        event = { "BufReadPre", "BufNewFile" },
        -- cond = function()
        --     local helpers = require("helpers")
        --     return helpers.is_node_installed() and helpers.is_python_installed()
        -- end,
        dependencies = {
            "mason-org/mason.nvim",
            "mason-org/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
        },
        opts = function()
            local helpers = require("helpers")

            local ensure_installed = {
                "lua_ls",
                "stylua",
                "tinymist",
            }

            if helpers.is_python_installed() then
                vim.list_extend(ensure_installed, {
                    "ruff",
                    "mdformat",
                })
            end

            if helpers.is_node_installed() then
                vim.list_extend(ensure_installed, {
                    "basedpyright",
                    "biome",
                })
            end

            return { ensure_installed = ensure_installed }
        end,
    },
}
