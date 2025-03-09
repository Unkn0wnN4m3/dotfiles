return {
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      transparent_background = false,
      background = { -- :h background
        light = "latte",
        dark = "macchiato",
      },
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
    "rose-pine/neovim",
    lazy = true,
    name = "rose-pine",
    opts = {
      dark_variant = "moon",
      dim_inactive_windows = true,
      styles = {
        italic = false,
      },
      highlight_groups = {
        Boolean = { italic = true },
      },
    },
  },
  -- {
  --   "dgox16/oldworld.nvim",
  --   lazy = true,
  --   opts = {
  --     styles = {
  --       keywords = { italic = true },
  --       functions = { bold = true },
  --       booleans = { italic = true },
  --     },
  --     highlight_overrides = {
  --       LspReferenceText = { link = "IlluminatedWordText" },
  --       LspReferenceRead = { link = "IlluminatedWordRead" },
  --       LspReferenceWrite = { link = "IlluminatedWordWrite" },
  --     },
  --   },
  -- },
  -- {
  --   "mellow-theme/mellow.nvim",
  --   lazy = true,
  --   init = function()
  --     vim.g.mellow_bold_functions = true
  --     vim.g.mellow_italic_keywords = true
  --     vim.g.mellow_italic_booleans = true
  --     vim.g.mellow_transparent = false
  --     vim.g.mellow_italic_comments = false
  --
  --     vim.g.mellow_highlight_overrides = {
  --       ["LspReferenceText"] = { link = "IlluminatedWordText" },
  --       ["LspReferenceRead"] = { link = "IlluminatedWordRead" },
  --       ["LspReferenceWrite"] = { link = "IlluminatedWordWrite" },
  --       ["Visual"] = { link = "IlluminatedWordText" },
  --       ["VisualNOS"] = { link = "IlluminatedWordText" },
  --     }
  --   end,
  -- },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = vim.env.NVIM_THEME or "catppuccin",
    },
  },
}
