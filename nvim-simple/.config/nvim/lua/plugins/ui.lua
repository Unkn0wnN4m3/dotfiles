return {
  { "nvim-tree/nvim-web-devicons", lazy = true },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = "VeryLazy",
    config = function()
      local function mixedIndent()
        local space_indent = vim.fn.search([[\v^ +]], "nw") > 0
        local tab_indent = vim.fn.search([[\v^\t+]], "nw") > 0
        local mixed = (space_indent and tab_indent) or (vim.fn.search([[\v^(\t+ | +\t)]], "nw") > 0)
        return mixed and "MI" or ""
      end

      local function showIndent()
        local width = vim.o.shiftwidth
        if vim.o.expandtab then
          return "spc: " .. width
        else
          return "tab: " .. width
        end
      end


      require("lualine").setup({
        options = {
          section_separators = "",
          component_separators = "",
          icons_enabled = false,
        },
        sections = {
          lualine_c = {
            { mixedIndent, color = "red" },
            { "buffers",   mode = 4 },
          },
          lualine_x = {
            showIndent,
            "fileformat",
            "filetype",
          },
        },
        tabline = {
          lualine_z = { { "tabs", mode = 0 } },
        },
        extensions = {
          "quickfix",
          "toggleterm",
          "man",
          "fugitive",
          "lazy",
          "trouble",
          "mason",
          "nvim-dap-ui",
        },
      })
    end,
  },
  {
    "b0o/incline.nvim",
    event = "BufReadPre",
    config = function()
      local devicons = require 'nvim-web-devicons'
      require('incline').setup {
        window = {
          padding = 0,
          margin = { horizontal = 0 },
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
          if filename == '' then
            filename = '[No Name]'
          end
          local ft_icon, ft_color = devicons.get_icon_color(filename)
          local modified = vim.bo[props.buf].modified
          return {
            ft_icon and { ' ', ft_icon, ' ', guibg = ft_color } or '',
            ' ',
            { filename, gui = modified and 'bold,italic' or 'bold' },
            ' ',
          }
        end,
      }
    end
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
    main = "ibl",
    opts = {
      indent = {
        char = "│",
        tab_char = "│",
      },
      scope = { show_start = false, show_end = false },
      exclude = {
        filetypes = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
        },
      },
    }
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      plugins = { spelling = true },
      defaults = {
        mode = { "n", "v" },
        ["g"] = { name = "+goto" },
        ["gs"] = { name = "+surround" },
        ["z"] = { name = "+fold" },
        ["]"] = { name = "+next" },
        ["["] = { name = "+prev" },
        ["<leader>q"] = { name = "+quit/session" },
        ["<leader>g"] = { name = "+git" },
        ["<leader>gh"] = { name = "+hunks" },
        ["<leader>x"] = { name = "+diagnostics/quickfix" },
        ["<leader>s"] = { name = "+search" },
        ["<leader>f"] = { name = "+file/find" },
        ["<leader>w"] = { name = "+windows" },
        ["<leader>u"] = { name = "+ui" },
        ["<leader>b"] = { name = "+buffer" },
        ["<leader><tab>"] = { name = "+tabs" },
      },
    },
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)
      wk.register(opts.defaults)
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      transparent_background = true, -- disables setting the background color.
      background = {                 -- :h background
        light = "latte",
        dark = "frappe",
      },
    },
  },
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    opts = {
      transparent_mode = true,
    },
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    opts = {
      styles = {
        bold = true,
        italic = true,
        transparency = true,
      },
    }
  },
  {
    "prichrd/netrw.nvim",
    config = true,
    event = 'VeryLazy',
  },
}
