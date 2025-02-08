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
        transparent = false,
        inverse = { -- Inverse highlight for different types
          visual = true,
        },
      },
    },
  },
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      transparent_background = false,
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
      transparent = false,
      styles = {
        comments = { italic = false },
        keywords = { italic = true },
        conditionals = { italic = true },
        functions = { bold = true },
      },
    },
  },
  {
    "mellow-theme/mellow.nvim",
    lazy = true,
    init = function()
      vim.g.mellow_bold_functions = true
      vim.g.mellow_italic_keywords = true
      vim.g.mellow_italic_booleans = true
      vim.g.mellow_transparent = true
      vim.g.mellow_italic_comments = false

      vim.g.mellow_highlight_overrides = {
        ["LspReferenceText"] = { link = "IlluminatedWordText" },
        ["LspReferenceRead"] = { link = "IlluminatedWordRead" },
        ["LspReferenceWrite"] = { link = "IlluminatedWordWrite" },
        ["Visual"] = { link = "IlluminatedWordText" },
        ["VisualNOS"] = { link = "IlluminatedWordText" },
      }
    end,
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
