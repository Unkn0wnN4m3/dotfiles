local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    return
end

local actions = require("telescope.actions")
local function telescope_buffer_dir()
    return vim.fn.expand("%:p:h")
end

local projects_path vim.fn.expand("$HOME/Documents/Projects/")
if vim.fn.has 'win32' == 1 then
    projects_path = "D:\\Julio\\Documents\\Projects\\"
end
-- local linux_projects = "D:\\Julio\\Documents\\Projects\\"

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

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "<leader>te", function()
    telescope.extensions.file_browser.file_browser({
        path = "%:p:h",
        cwd = telescope_buffer_dir(),
        respect_gitignore = false,
        hidden = true,
        grouped = true,
        previewer = false,
        initial_mode = "normal",
        layout_config = { height = 40 },
    })
end)
keymap("n", "<leader>tf", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>tg", ":Telescope live_grep theme=ivy<CR>", opts)
keymap("n", "<leader>tp", ":Telescope projects<CR>", opts)
keymap("n", "<leader>tb", ":Telescope buffers<CR>", opts)
