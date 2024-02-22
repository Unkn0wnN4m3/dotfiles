return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "Personal",
        path = "~/vaults/Personal",
      },
      {
        name = "School",
        path = "~/vaults/School",
      },
    },
    notes_subdir = "notes",
  },
}
