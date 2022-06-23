local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
  return
end

vim.opt.list = true
vim.opt.listchars = {
  eol = '↲',
  tab = '▸ ',
  extends = '»',
  precedes = '«',
  space = '⋅',
  -- trail = '•'
}

indent_blankline.setup {
  char = '▏',
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
  },
  buftype_exclude = {
    "terminal",
    "TelescopePrompt",
    "NvimTree",
    "Trouble"
  },
  show_end_of_line = true,
  space_char_blankline = " ",
  treesitter = true
}
