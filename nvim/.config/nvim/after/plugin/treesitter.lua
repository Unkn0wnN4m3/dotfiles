local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup({
  ensure_installed = {
    "json",
    "yaml",
    "dockerfile",
    "bash",
    "fish",
    "html",
    "css",
    "scss",
    "javascript",
    "typescript",
    "tsx",
    "vue",
    "java",
    "vim",
    "lua",
    "python",
    "c",
    "go",
    "comment",
    "markdown",
    "embedded_template"
  },
  ignore_install = {},
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {
      "python",
      "css"
    }
  },
  refactor = {
    highlight_definitions = { enable = true },
    highlight_current_scope = { enable = false },
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = "grr",
      },
    },
    navigation = {
      enable = true,
      keymaps = {
        goto_next_usage = "<a-n>",
        goto_previous_usage = "<a-p>",
      },
    },
  },
  autotag = {
    enable = true,
    disable = {}
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  }
})
