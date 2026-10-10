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
                    formatterIndentSize = 2,
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

            local ensure_installed = { "lua_ls", "stylua", "tinymist" }
            local python_bins = { "ruff", "mdformat" }
            local node_bins = { "basedpyright", "biome" }

            local function set_binaries()
                local bins = vim.deepcopy(ensure_installed)

                if helpers.is_installed("python") then
                    bins = vim.list_extend(bins, python_bins)
                end

                if helpers.is_installed("node") then
                    bins = vim.list_extend(bins, node_bins)
                end

                return bins
            end

            return { ensure_installed = set_binaries() }
        end,
    },
}
