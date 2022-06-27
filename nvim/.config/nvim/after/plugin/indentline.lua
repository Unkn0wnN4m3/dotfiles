local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
  return
end

indent_blankline.setup({
  char = "▏",
  filetype = {
    "javascript",
    "javascriptreact",
    "jsx",
    "vue",
    "html",
    "css",
    "scss",
    "dockerfile",
    "json",
    "htmldjango",
  },
  buftype_exclude = {
    "terminal",
    "TelescopePrompt",
    "toggleterm",
    "NvimTree",
    "Trouble",
    "lspinfo",
    "packer",
    "checkhealth",
    "help",
    "man",
    "",
  },
  show_end_of_line = true,
  space_char_blankline = " ",
  treesitter = true,
})
