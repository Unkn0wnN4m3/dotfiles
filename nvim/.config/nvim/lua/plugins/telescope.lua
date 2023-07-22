return {
    {
        "nvim-telescope/telescope.nvim",
        version = "0.*",
        -- lazy = false,
        event = "VeryLazy",
        dependencies = {
            {
                "nvim-telescope/telescope-project.nvim",
                commit = "8e8ee37b7210761502cdf2c3a82b5ba8fb5b2972"
            },
        },
        keys = {
            { "<leader>tf", "<CMD>Telescope find_files<CR>", },
            { "<leader>tg", "<CMD>Telescope live_grep theme=ivy<CR>", },
            { "<leader>tp", "<CMD>Telescope project<CR>" },
            { "<leader>tb", "<CMD>Telescope buffers<CR>" },
        },
        config = function()
            local telescope = require("telescope")
            local actions = require("telescope.actions")

            local projects_path = vim.fn.expand("$HOME/Documents/Projects/")

            telescope.setup({
                defaults = {
                    layout_config = {
                        prompt_position = 'top',
                    },
                    sorting_strategy = "ascending",
                    prompt_prefix = " ",
                    selection_caret = " ",
                    path_display = { "smart" },
                    file_ignore_patterns = { ".git", "node_modules", ".venv", "__pycache__" },
                    mappings = {
                        i = {
                            ["<Down>"] = actions.cycle_history_next,
                            ["<Up>"] = actions.cycle_history_prev,
                            -- ["<C-j>"] = actions.move_selection_next,
                            -- ["<C-k>"] = actions.move_selection_previous,
                        },
                    },
                },
                extensions = {
                    project = {
                        base_dirs = {
                            {
                                path = projects_path .. "Scripts",
                                max_depth = 3
                            },
                            {
                                path = projects_path .. "WebDevelopment",
                                max_depth = 3
                            },
                        },
                    },
                },
            })

            telescope.load_extension('project')
        end,
    },
}
