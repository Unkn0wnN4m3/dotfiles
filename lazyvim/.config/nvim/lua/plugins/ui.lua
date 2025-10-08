local function check_indentation()
  -- from Copilot
  local space_indent = false
  local tab_indent = false
  local tabstop_size = vim.api.nvim_get_option_value("tabstop", { buf = 0 })

  -- limits to the first 500 lines for better performance
  local max_lines = 500
  local lines = vim.api.nvim_buf_get_lines(0, 0, max_lines, false)

  for _, line in ipairs(lines) do
    if line:find("^%s") then
      if line:find("^\t") then
        tab_indent = true
      elseif line:find("^ +") then
        space_indent = true
      end
    end
    if space_indent and tab_indent then
      break
    end
  end

  if space_indent and tab_indent then
    return "mixed"
  elseif space_indent then
    return "spc:" .. tabstop_size
  elseif tab_indent then
    return "tab:" .. tabstop_size
  else
    return "none"
  end
end

local function open_tabs()
  if vim.fn.tabpagenr("$") > 1 then
    return " "
  else
    return ""
  end
end

local function venv_component()
  if vim.bo[0].filetype ~= "python" then
    return ""
  end

  local venv_path = require("venv-selector").venv()
  if not venv_path or venv_path == "" then
    return ""
  end

  local venv_name = vim.fn.fnamemodify(venv_path, ":t")
  if not venv_name then
    return ""
  end

  local output = "🐍 " .. venv_name
  return output
end

return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.options.component_separators = ""
      opts.options.section_separators = ""
      table.insert(opts.sections.lualine_x, 1, venv_component)
      opts.sections.lualine_y = {
        { check_indentation, padding = { left = 1, right = 1 } },
        { "progress", padding = { left = 0, right = 1 } },
        { open_tabs, padding = { left = 0, right = 1 } },
      }
      opts.sections.lualine_z = { { "location", padding = { left = 1, right = 1 } } }
    end,
  },
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
      table.insert(
        opts.dashboard.preset.keys,
        2,
        { icon = "󰤇 ", key = "z", desc = "Zoxide Jump", action = ":FzfLua zoxide" }
      )
      opts.notifier.timeout = 10000
    end,
  },
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      opts.presets.lsp_doc_border = true
    end,
  },
  {
    "b0o/incline.nvim",
    -- dependencies = {
    --   "nvim-tree/nvim-web-devicons",
    -- },
    event = "VeryLazy",
    config = function()
      local helpers = require("incline.helpers")
      local devicons = require("nvim-web-devicons")

      require("incline").setup({
        hide = {
          cursorline = true,
        },
        window = {
          padding = 0,
          margin = { horizontal = 0 },
        },
        render = function(props)
          local buf_number = props.buf
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(buf_number), ":t")
          if filename == "" then
            filename = "[No Name]"
          end
          local ft_icon, ft_color = devicons.get_icon_color(filename)
          local modified = vim.bo[buf_number].modified
          local guifg_style = modified and Snacks.util.color("WarningMsg") or nil
          local gui_style = modified and "italic,bold" or "bold"

          return {
            ft_icon and { " ", ft_icon, " ", guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or "",
            " ",
            {
              filename,
              guifg = guifg_style,
              gui = gui_style,
            },
            { "|", guifg = guifg_style },
            {
              buf_number,
              guifg = guifg_style,
              gui = gui_style,
            },
            " ",
          }
        end,
      })
    end,
  },
}
