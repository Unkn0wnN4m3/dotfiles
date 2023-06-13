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
        "tpope/vim-fugitive",
        version = "v3.*",
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
        event = "BufReadPre",
        opts = {
            ignore = '^$'
        }
    },
    {
        "windwp/nvim-autopairs",
        commit = "59df87a84c80a357ca8d8fe86e451b93ac476ccc",
        config = true,
        event = "InsertEnter",
        opts = {
            fast_wrap = {},
        }
    },
    {
        "tpope/vim-surround",
        event = "BufReadPre",
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
        config = true,
        keys = {
            { "qs", "<CMD>lua require('persistence').load()<CR>",                mode = "n" },
            { "ql", "<CMD>lua require('persistence').load({ last = true })<CR>", mode = "n" },
            { "qd", "<CMD>lua require('persistence').stop()<CR>",                mode = "n" }
        }
    },
    {
        "ggandor/leap.nvim",
        commit = "14b5a65190fe69388a8f59c695ed3394a10d6af8",
        config = function()
            require('leap').add_default_mappings()
        end
    }
}
