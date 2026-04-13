return {
    "stevearc/conform.nvim",
    cmd = "ConformInfo",
    keys = {
        {
            "<leader>cf",
            function()
                require("conform").format({ async = true })
            end,
            mode = "",
            desc = "Format buffer",
        },
    },
    init = function()
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            typst = { "typstyle" },
        },
        default_format_opts = {
            lsp_format = "fallback",
        },
    }
}
