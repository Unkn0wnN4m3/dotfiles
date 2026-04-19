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
            vim.lsp.config("copilot", {
                settings = {
                    telemetry = { telemetryLevel = "off" },
                },
            })
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
        dependencies = {
            "mason-org/mason.nvim",
            "mason-org/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
        },
        opts = {
            ensure_installed = {
                "lua_ls",
                "stylua",
                "tinymist",
                "copilot",
                "basedpyright",
                "ruff",
                "mdformat",
                "biome",
            },
        },
    },
}
