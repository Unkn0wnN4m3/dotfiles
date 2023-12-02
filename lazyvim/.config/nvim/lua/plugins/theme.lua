return {
  {
    "ellisonleao/gruvbox.nvim",
    opts = {
      terminal_colors = true,
      invert_selection = true,
      -- transparent_mode = true,
      italic = { strings = false },
      overrides = {
        WinBar = { bg = "None", bold = true },
        WinBarNC = { bg = "None" },
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
