return {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
        {
            "mason-org/mason-lspconfig.nvim",
            opts = { automatic_enable = { exclude = { "ruff", "stylua" } } },
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
        },
    },
}
