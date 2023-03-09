return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.0",
        lazy = false,
        dependencies = {
            {
                "nvim-lua/plenary.nvim",
                tag = "v0.1.2"
            },
            {
                "nvim-telescope/telescope-file-browser.nvim",
                commit = "304508fb7bea78e3c0eeddd88c4837501e403ae8"
            },
            {
                "nvim-telescope/telescope-project.nvim",
                commit = "8e8ee37b7210761502cdf2c3a82b5ba8fb5b2972"
            },
        },
        keys = {
            { "<leader>tf", "<CMD>Telescope find_files<CR>", desc = "Find project files" },
            { "<leader>tg", "<CMD>Telescope live_grep theme=ivy<CR>", },
            { "<leader>tp", "<CMD>Telescope project<CR>" },
            { "<leader>tb", "<CMD>Telescope buffers<CR>" },
            {
                "<leader>te", function()
                    local function telescope_buffer_dir()
                        return vim.fn.expand("%:p:h")
                    end

                    require("telescope").extensions.file_browser.file_browser({
                        path = "%:p:h",
                        cwd = telescope_buffer_dir(),
                        respect_gitignore = false,
                        hidden = true,
                        grouped = true,
                        previewer = false,
                        initial_mode = "normal",
                        layout_config = { height = 40 },
                    })

                end
            },
        },
        config = function()
            local telescope = require("telescope")
            local actions = require("telescope.actions")

            local projects_path = vim.fn.expand("$HOME/Documents/Projects/")

            telescope.setup({
                defaults = {
                    prompt_prefix = " ",
                    selection_caret = " ",
                    path_display = { "smart" },
                    file_ignore_patterns = { ".git", "node_modules", "venv", "__pycache__" },
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
                    file_browser = {
                        theme = "dropdown",
                        previewer = false,
                        -- disables netrw and use telescope-file-browser in its place
                        hijack_netrw = true,
                        mappings = {
                            ["n"] = {
                                ["/"] = function()
                                    vim.cmd("startinsert")
                                end,
                            },
                        },
                    },
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

            telescope.load_extension("file_browser")
            telescope.load_extension('project')
        end,
    },
}
