return {
    {
        "lewis6991/gitsigns.nvim",
        tag = "v0.6",
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
                        tag = "v0.1.2"
                    },
                },
                tag = "v1.0.0",
                config = true,
            },

        },
        tag = "v1.0.0",
        config = true,
        keys = {
            { "<leader>xx", "<CMD>Trouble<CR>" },
            { "<leader>xw", "<CMD>Trouble workspace_diagnostics<CR>" },
            { "<leader>xd", "<CMD>Trouble document_diagnostics<CR>" },
            { "<leader>xt", "<CMD>TodoTrouble<CR>",                  desc = "Show todo-comments in trouble.nvim" },
            { "gR",         "<CMD>Trouble lsp_references<CR>" },
        }
    },
    {
        "numToStr/Comment.nvim",
        tag = "v0.7.0",
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
        tag = "v2.2"
    },
    {
        "tpope/vim-obsession",
        commit = "fe9d3e1a9a50171e7d316a52e1e56d868e4c1fe5"
    },
}
