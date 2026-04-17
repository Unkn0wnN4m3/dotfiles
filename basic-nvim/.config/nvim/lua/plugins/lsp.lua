return {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        {
            "mason-org/mason-lspconfig.nvim",
            opts = { automatic_enable = { exclude = { "ruff", "stylua" } } },
        },
        {
            "neovim/nvim-lspconfig",
            config = function()
                vim.lsp.config(
                    "copilot",
                    { settings = { telemetry = { telemetryLevel = "off" } } }
                )
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
        },
    },
}
