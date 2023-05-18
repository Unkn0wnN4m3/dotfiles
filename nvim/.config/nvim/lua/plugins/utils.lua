return {
    {
        "lewis6991/gitsigns.nvim",
        version = "v0.*",
        config = true,
        cond = function()
            local filepath = vim.fn.expand('%:p:h')
            local gitdir = vim.fn.finddir('.git', filepath .. ';')
            return gitdir and #gitdir > 0 and #gitdir < #filepath
        end,
    },
    {
        "folke/trouble.nvim",
        dependencies = {
            { "nvim-tree/nvim-web-devicons" },
            {
                "folke/todo-comments.nvim",
                dependencies = {
                    {
                        "nvim-lua/plenary.nvim",
                        version = "v0.*"
                    },
                },
                version = "v1.*",
                config = true,
            },

        },
        version = "v1.*",
        config = function()
            require("trouble").setup({
                use_diagnostic_signs = true
            })
        end,
        keys = {
            { "<leader>xx", "<CMD>Trouble<CR>" },
            { "<leader>xw", "<CMD>Trouble workspace_diagnostics<CR>" },
            { "<leader>xd", "<CMD>Trouble document_diagnostics<CR>" },
            { "<leader>xt", "<CMD>TodoTrouble<CR>", },
            { "gR",         "<CMD>Trouble lsp_references<CR>" },
        }
    },
    {
        "numToStr/Comment.nvim",
        version = "v0.*",
        opts = {
            ignore = '^$'
        }
    },
    {
        "windwp/nvim-autopairs",
        commit = "f00eb3b766c370cb34fdabc29c760338ba9e4c6c",
        config = true,
        event = "InsertEnter",
        opts = {
            fast_wrap = {},
        }
    },
    {
        "tpope/vim-surround",
        version = "v2.*"
    },
    -- {
    --     "tpope/vim-obsession",
    --     commit = "fe9d3e1a9a50171e7d316a52e1e56d868e4c1fe5"
    -- },
    {
        "folke/persistence.nvim",
        version = "v1.*",
        event = "BufReadPre",
        module = "persistence",
        config = true,
        keys = {
            { "qs", "<CMD>lua require('persistence').load()<CR>",                mode = "n" },
            { "ql", "<CMD>lua require('persistence').load({ last = true })<CR>", mode = "n" },
            { "qd", "<CMD>lua require('persistence').stop()<CR>",                mode = "n" }
        }
    },
    {
        "nanotee/zoxide.vim",
        commit = "7582d5441f68c46b8fbd42a8721cde0c0dfe344b",
        dependencies = {
            {
                "junegunn/fzf",
                version = "0.*"
            }
        }
    }
}
