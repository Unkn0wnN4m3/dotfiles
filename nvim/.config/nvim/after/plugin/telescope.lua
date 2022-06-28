local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require("telescope.actions")

telescope.setup({
  defaults = {

    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },
    file_ignore_patterns = { ".git/", "node_modules", "venv", "__pycache__" },

    mappings = {
      i = {
        ["<Down>"] = actions.cycle_history_next,
        ["<Up>"] = actions.cycle_history_prev,
        -- ["<C-j>"] = actions.move_selection_next,
        -- ["<C-k>"] = actions.move_selection_previous,
      },
    },
    extensions = {
      fzf = {
        fuzzy = true, -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true, -- override the file sorter
        case_mode = "smart_case", -- or "ignore_case" or "respect_case" the default case_mode is "smart_case"
      },
      project = {
        base_dirs = {
          { path = "~/go_exercises", max_depth = 2 },
          { path = "~/python_exercises", max_depth = 2 },
          { path = "~/Sqlite3_exercises/", max_depth = 2 },
          { path = "~/.dotfiles" },
        },
        hidden_files = true,
      },
    },
  },
})

require("telescope").load_extension("fzf")
