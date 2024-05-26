return {
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
          lualine_a = {},
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = { { "tabs", mode = 2 } },
        },
        winbar = {
          lualine_b = {
            {
              "filename",
              path = 1,
              shorting_target = 60,
              color = { bg = "None", fg = "text", gui = "bold" },
            },
          },
          lualine_c = {
            {
              color_correction = nil,
              navic_opts = nil,
              color = { bg = "None", fg = "text" },
            },
          },
        },
        inactive_winbar = {
          lualine_b = {
            {
              "filename",
              path = 1,
              shorting_target = 60,
              color = { bg = "None", fg = "text", gui = "bold" },
            },
          },
          lualine_c = {
            {
              color_correction = nil,
              navic_opts = nil,
              color = { bg = "None", fg = "text" },
            },
          },
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
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme("catppuccin")
    end
  },
  {
    "rcarriga/nvim-notify",
    keys = {
      {
        "<leader>un",
        function()
          require("notify").dismiss({ silent = true, pending = true })
        end,
        desc = "Dismiss All Notifications",
      },
    },
    opts = {
      stages = "static",
      timeout = 3000,
      max_height = function()
        return math.floor(vim.o.lines * 0.75)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.75)
      end,
      on_open = function(win)
        vim.api.nvim_win_set_config(win, { zindex = 100 })
      end,
    },
  },
  { "nvim-tree/nvim-web-devicons", lazy = true },
}
