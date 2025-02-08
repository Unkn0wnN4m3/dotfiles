local icons = require("lazyvim.config").icons

local function showIndent()
  local width = vim.o.shiftwidth
  if vim.o.expandtab then
    return "spc: " .. width
  else
    return "tab: " .. width
  end
end

local function mixedIndent()
  local space_indent = vim.fn.search([[\v^ +]], "nw") > 0
  local tab_indent = vim.fn.search([[\v^\t+]], "nw") > 0
  local mixed = (space_indent and tab_indent) or (vim.fn.search([[\v^(\t+ | +\t)]], "nw") > 0)
  return mixed and "MI" or ""
end

return {
  {
    "folke/snacks.nvim",
    opts = function(_, opts)
      opts.dashboard.preset.header = [[
   ██╗  ██╗ █████╗ ██╗  ██╗███╗   ███╗ ██████╗██╗  ██╗███╗   ██╗
   ██║  ██║██╔══██╗██║ ██╔╝████╗ ████║██╔════╝██║  ██║████╗  ██║
   ███████║███████║█████╔╝ ██╔████╔██║██║     ███████║██╔██╗ ██║
   ██╔══██║██╔══██║██╔═██╗ ██║╚██╔╝██║██║     ██╔══██║██║╚██╗██║
   ██║  ██║██║  ██║██║  ██╗██║ ╚═╝ ██║╚██████╗██║  ██║██║ ╚████║
   ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝ ╚═════╝╚═╝  ╚═╝╚═╝  ╚═══╝
        ]]
      opts.dashboard.sections = {
        { section = "header" },
        { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
        { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
        { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
        { section = "startup" },
      }
    end,
  },
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        mode = "tabs",
      },
    },
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 10000,
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        icons_enabled = false,
        section_separators = "",
        component_separators = "",
        theme = "auto",
        globalstatus = true,
        disabled_filetypes = { statusline = { "snacks_dashboard" } },
      },
      sections = {
        lualine_c = {
          {
            "diagnostics",
            symbols = {
              error = icons.diagnostics.Error,
              warn = icons.diagnostics.Warn,
              info = icons.diagnostics.Info,
              hint = icons.diagnostics.Hint,
            },
          },
          {
            "buffers",
            mode = 4,
            buffers_color = {
              active = "lualine_b_normal",
              inactive = "lualine_b_inactive",
            },
          },
        },
        lualine_y = {
          mixedIndent,
          showIndent,
          "fileformat",
          "filetype",
        },
        lualine_z = {
          { "progress", separator = " ", padding = { left = 1, right = 0 } },
          { "location", padding = { left = 0, right = 1 } },
        },
      },
      extensions = {
        "neo-tree",
        "lazy",
        "quickfix",
        "toggleterm",
        "man",
        "fugitive",
        "trouble",
        "mason",
        "nvim-dap-ui",
      },
    },
  },
  {
    "folke/noice.nvim",
    opts = {
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        lsp_doc_border = true,
      },
    },
  },
  {
    "b0o/incline.nvim",
    event = "VeryLazy",
    config = function()
      local helpers = require("incline.helpers")
      local devicons = require("nvim-web-devicons")

      require("incline").setup({
        window = {
          padding = 0,
          margin = { horizontal = 0 },
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          if filename == "" then
            filename = "[No Name]"
          end
          local ft_icon, ft_color = devicons.get_icon_color(filename)
          local modified = vim.bo[props.buf].modified
          return {
            ft_icon and { " ", ft_icon, " ", guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or "",
            " ",
            { filename, gui = modified and "bold,italic" or "bold" },
            " ",
          }
        end,
      })
    end,
  },
}
