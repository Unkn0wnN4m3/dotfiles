return {
  -- {
  --   "ellisonleao/gruvbox.nvim",
  --   lazy = true,
  --   opts = {
  --     terminal_colors = true,
  --     invert_selection = true,
  --     transparent_mode = false,
  --     italic = { strings = false },
  --     overrides = {
  --       WinBar = { bg = "None", bold = true },
  --       WinBarNC = { bg = "None" },
  --     },
  --   },
  -- },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      transparent_background = true,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
