return {
    {
        "sheerun/vim-polyglot",
        version = "v4.*",
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
                    "jsonc"
                },
                auto_install = false,
                highlight = {
                    enable = false,
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = false,
                        scope_incremental = false,
                        node_incremental = "gtn",
                        node_decremental = "gtm",
                    },
                },
            })
            vim.opt.foldmethod = "expr"
            vim.cmd("set foldexpr=nvim_treesitter#foldexpr()")
            vim.opt.foldenable = false
        end
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
        end
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
            "typescript"
        },
        init = function()
            vim.cmd([[
                let g:user_emmet_leader_key='<C-Z>'
           ]])
        end
    },
    {
        "mhartington/formatter.nvim",
        commit = "34dcdfa0c75df667743b2a50dd99c84a557376f0",
        ft = {
            "python",
            "c"
        },
        config = function()
            require("formatter").setup({
                filetype = {
                    python = {
                        require("formatter.filetypes.python").yapf,
                        require("formatter.filetypes.python").isort,
                    },
                    c = {
                        require("formatter.filetypes.c").clangformat
                    }
                }
            })
        end
    },
    {
        "mfussenegger/nvim-lint",
        commit = "962a76877a4479a535b935bd7ef35ad41ba308b2",
        ft = {
            "python",
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
        },
        config = function()
            require('lint').linters_by_ft = {
                javascript = { "eslint" },
                javascriptreact = { "eslint" },
                typescript = { "eslint" },
                typescriptreact = { "eslint" },
                python = { "flake8" }
            }

            local flake8 = require('lint').linters.flake8
            flake8.cmd = "./.venv/bin/flake8" or "flake8"


            vim.api.nvim_create_autocmd(
                { "BufWritePost", "InsertLeave" },
                {
                    group = vim.api.nvim_create_augroup("linters", { clear = true }),
                    callback = function()
                        require("lint").try_lint()
                    end,
                }
            )
        end
    }
}
