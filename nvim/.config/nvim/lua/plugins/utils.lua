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
    {
        "echasnovski/mini.nvim",
        tag = "v0.10.0",
        event = "VeryLazy",
        config = function()
            require("mini.surround").setup()
            require("mini.pairs").setup()
            require("mini.comment").setup()
            require("mini.jump2d").setup()
            require("mini.sessions").setup({ autowrite = true })
        end,
        keys = {
            { "<leader>msr", "<CMD>lua MiniSessions.read()<CR>", mode = "n" },
            { "<leader>msc", "<CMD>lua MiniSessions.write('Session.vim')<CR>", mode = "n" },
            { "<leader>msd", "<CMD>lua MiniSessions.delete()<CR>", mode = "n" },
        },
    },
}
