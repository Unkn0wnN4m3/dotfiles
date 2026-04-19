return {
    "stevearc/conform.nvim",
    cmd = "ConformInfo",
    keys = {
        {
            "<leader>cf",
            function()
                require("conform").format({ async = true })
            end,
            mode = "n",
            desc = "Format buffer",
        },
    },
    init = function()
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            typst = { "typstyle", lsp_format = "first" },
            python = { "ruff", "ruff_organize_imports", lsp_format = "never" },
            markdown = { "mdformat" },
        },
        default_format_opts = {
            lsp_format = "fallback",
        },
    },
}
