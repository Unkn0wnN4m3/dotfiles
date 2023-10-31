return {
    {
        "lewis6991/gitsigns.nvim",
        version = "v0.*",
        event = "VeryLazy",
        dependencies = {
            {
                "tpope/vim-fugitive",
                version = "v3.*",
            },
        },
        config = function()
            require("gitsigns").setup({
                on_attach = function(bufnr)
                    local gs = package.loaded.gitsigns

                    local function map(mode, l, r, opts)
                        opts = opts or {}
                        opts.buffer = bufnr
                        vim.keymap.set(mode, l, r, opts)
                    end

                    -- Navigation
                    map("n", "]c", function()
                        if vim.wo.diff then
                            return "]c"
                        end
                        vim.schedule(function()
                            gs.next_hunk()
                        end)
                        return "<Ignore>"
                    end, { expr = true })

                    map("n", "[c", function()
                        if vim.wo.diff then
                            return "[c"
                        end
                        vim.schedule(function()
                            gs.prev_hunk()
                        end)
                        return "<Ignore>"
                    end, { expr = true })
                end,
            })
        end,
    },
    {
        "folke/trouble.nvim",
        version = "v2.*",
        event = "VeryLazy",
        dependencies = {
            {
                "folke/todo-comments.nvim",
                version = "v1.*",
                config = true,
            },
        },
        opts = {
            use_diagnostic_signs = true,
        },
        keys = {
            { "<leader>xx", "<CMD>Trouble<CR>" },
            { "<leader>xw", "<CMD>Trouble workspace_diagnostics<CR>" },
            { "<leader>xd", "<CMD>Trouble document_diagnostics<CR>" },
            { "<leader>xt", "<CMD>TodoTrouble<CR>" },
            { "gR", "<CMD>Trouble lsp_references<CR>" },
        },
    },
    {
        "numToStr/Comment.nvim",
        version = "v0.*",
        event = "VeryLazy",
        opts = {
            ignore = "^$",
        },
    },
    {
        "windwp/nvim-autopairs",
        commit = "59df87a84c80a357ca8d8fe86e451b93ac476ccc",
        config = true,
        event = "InsertEnter",
        opts = {
            fast_wrap = {},
        },
    },
    {
        "tpope/vim-surround",
        event = "VeryLazy",
        version = "v2.*",
    },
    {
        "folke/persistence.nvim",
        version = "v1.*",
        event = "VeryLazy",
        config = true,
        keys = {
            { "qs", "<CMD>lua require('persistence').load()<CR>", mode = "n" },
            { "ql", "<CMD>lua require('persistence').load({ last = true })<CR>", mode = "n" },
            { "qd", "<CMD>lua require('persistence').stop()<CR>", mode = "n" },
        },
    },
    {
        "ggandor/leap.nvim",
        event = "VeryLazy",
        commit = "14b5a65190fe69388a8f59c695ed3394a10d6af8",
        config = function()
            require("leap").add_default_mappings()
        end,
    },
    {
        "nvim-tree/nvim-web-devicons",
        lazy = true,
    },
    {
        "nvim-lua/plenary.nvim",
        version = "v0.*",
        lazy = true,
    },
    {
        "tiagovla/scope.nvim",
        commit = "cd27af77ad61a7199af5c28d27013fb956eb0e3e",
        event = "VeryLazy",
        config = true,
    },
}
