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
        dependencies = "nvim-tree/nvim-web-devicons",
        tag = "v1.0.0",
        config = true,
        keys = {
            { "<leader>xx", "<CMD>Trouble<CR>" },
            { "<leader>xw", "<CMD>Trouble workspace_diagnostics<CR>" },
            { "<leader>xd", "<CMD>Trouble document_diagnostics<CR>" },
            { "gR", "<CMD>Trouble lsp_references<CR>" },
        }
    },
    -- TODO: Test
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
        lazy = false,
        keys = {
            { "<leader>xt", "<CMD>TodoTrouble<CR>", desc = "Show todo-comments in trouble.nvim" }
        }
    },
    {
        "numToStr/Comment.nvim",
        tag = "v0.7.0",
        config = true,
    },
    {
        "windwp/nvim-autopairs",
        commit = "f00eb3b766c370cb34fdabc29c760338ba9e4c6c",
        config = true,
        event = "InsertEnter",
    },
}
