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
    {
        "tpope/vim-obsession",
        commit = "fe9d3e1a9a50171e7d316a52e1e56d868e4c1fe5"
    },
}
