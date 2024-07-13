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

local actived_venv = function()
  local venv_name = require("venv-selector").get_active_venv()
  if venv_name ~= nil then
    return "[ ON]"
  else
    return ""
  end
end

return {
  {
    {
      "nvimdev/dashboard-nvim",
      opts = function(_, opts)
        local logo = [[
        ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
        ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
        ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
        ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
        ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
        ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
      ]]

        logo = string.rep("\n", 8) .. logo .. "\n\n"
        opts.config.header = vim.split(logo, "\n")
      end,
    },
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
        disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
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
          actived_venv,
          showIndent,
          "fileformat",
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
}
