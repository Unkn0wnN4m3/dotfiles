return {
  {
    "ellisonleao/gruvbox.nvim",
    lazy = true,
    opts = {
      terminal_colors = true,
      invert_selection = true,
      transparent_mode = false,
      italic = { strings = false },
      overrides = {
        WinBar = { bg = "None", bold = true },
        WinBarNC = { bg = "None" },
      },
    },
  },
  {
    "EdenEast/nightfox.nvim",
    lazy = true,
    opts = {
      options = {
        transparent = true,
        inverse = { -- Inverse highlight for different types
          visual = true,
        },
      },
    },
  },
  {
    "dgox16/oldworld.nvim",
    lazy = true,
    opts = {
      styles = {
        booleans = { italic = true },
        functions = { bold = true },
        keywords = { italic = true },
      },
    },
  },
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      transparent_background = true,
      -- no_italic = true,
      styles = {
        comments = {},
        functions = { "bold" },
        conditionals = { "italic" },
        keywords = { "italic" },
      },
    },
  },
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = true,
    opts = {
      transparent = true,
      styles = {
        comments = { italic = false },
        keywords = { italic = true },
        conditionals = { italic = true },
        functions = { bold = true },
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = function()
      local t = vim.env.NVIM_THEME
      local status, _ = pcall(require, t)
      local theme

      if not status then
        theme = "catppuccin"
      else
        theme = t
      end

      local opts = {
        colorscheme = theme,
      }

      return opts
    end,
  },
}
