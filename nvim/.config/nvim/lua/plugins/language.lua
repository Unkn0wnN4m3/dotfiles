return {
    {
        "sheerun/vim-polyglot",
        version = "v4.*",
        init = function()
            vim.cmd("let g:polyglot_disabled = ['ftdetect']")
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        version = "v0.9.*",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "c",
                    "python",
                    "typescript",
                    "tsx",
                    "javascript",
                    "lua",
                    "vim",
                    "vimdoc",
                    "markdown",
                    "markdown_inline",
                    "latex",
                    "html",
                    "css",
                    "json",
                    "jsonc",
                },
                auto_install = false,
                highlight = {
                    enable = false,
                },
            })
            vim.opt.foldmethod = "expr"
            vim.cmd("set foldexpr=nvim_treesitter#foldexpr()")
            vim.opt.foldenable = false
        end,
    },
    {
        "iamcco/markdown-preview.nvim",
        ft = "markdown",
        version = "v0.0.*",
        -- build = "cd app && npm install",
        build = function()
            vim.fn["mkdp#util#install"]()
        end,
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
            vim.g.mkdp_echo_preview_url = 1
        end,
    },
    {
        "mattn/emmet-vim",
        commit = "def5d57a1ae5afb1b96ebe83c4652d1c03640f4d",
        ft = {
            "html",
            "jinja.html",
            "htmldjango",
            "javascriptreact",
            "typescriptreact",
            "javascript",
            "typescript",
        },
        init = function()
            vim.cmd([[
                let g:user_emmet_leader_key='<C-Z>'
           ]])
        end,
    },
    {
        "stevearc/conform.nvim",
        version = "v4.0.*",
        event = { "LspAttach" },
        init = function()
            vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
        end,
        config = function()
            local conform = require("conform")
            local mason_path = vim.fn.stdpath("data") .. "/mason/"
            local fmts = { "stylua", "isort", "yapf", "prettier", "prettierd" }

            for _, v in ipairs(fmts) do
                conform.formatters = {
                    v = {
                        cammand = mason_path .. "bin/" .. v,
                    },
                }
            end

            conform.setup({
                formatters_by_ft = {
                    lua = { "stylua" },
                    python = { "isort", "yapf" },
                    javascript = { { "prettierd", "prettier" } },
                    typescript = { { "prettierd", "prettier" } },
                    c = { "clang-format" },
                },
            })

            vim.api.nvim_create_user_command("Format", function(args)
                local range = nil
                if args.count ~= -1 then
                    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
                    range = {
                        start = { args.line1, 0 },
                        ["end"] = { args.line2, end_line:len() },
                    }
                end
                require("conform").format({ async = true, lsp_fallback = true, range = range })
            end, { range = true })
        end,
    },
    {
        "mfussenegger/nvim-lint",
        commit = "962a76877a4479a535b935bd7ef35ad41ba308b2",
        event = "LspAttach",
        config = function()
            local mason_path = vim.fn.stdpath("data") .. "/mason/"
            local lint = require("lint")

            local flake8 = lint.linters.flake8
            flake8.cmd = mason_path .. "bin/flake8"

            lint.linters_by_ft = {
                javascript = { "eslint" },
                javascriptreact = { "eslint" },
                typescript = { "eslint" },
                typescriptreact = { "eslint" },
                python = { "flake8" },
            }

            vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
                group = vim.api.nvim_create_augroup("linters", { clear = true }),
                callback = function()
                    lint.try_lint()
                end,
            })
        end,
    },
}
