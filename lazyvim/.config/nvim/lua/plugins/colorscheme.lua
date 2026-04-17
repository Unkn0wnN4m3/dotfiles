return {
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      transparent_background = false,
      background = {
        light = "latte",
        dark = "macchiato",
      },
    },
  },
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = true,
    opts = {
      transparent = false,
    },
  },
  {
    "rose-pine/neovim",
    lazy = true,
    name = "rose-pine",
    opts = {
      dark_variant = "moon",
      dim_inactive_windows = true,
    },
  },
  {
    "mellow-theme/mellow.nvim",
    lazy = true,
    init = function()
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
    opts = function(_, opts)
      local theme = vim.env.NVIM_THEME or "tokyonight"
      local valid_themes = { "tokyonight", "catppuccin", "solarized-osaka", "rose-pine", "mellow" }

      if vim.tbl_contains(valid_themes, theme) then
        opts.colorscheme = theme
      else
        vim.notify("Invalid theme: " .. theme .. ". Falling back to 'tokyonight'.", vim.log.levels.WARN)
        opts.colorscheme = "tokyonight"
      end
    end,
  },
}
