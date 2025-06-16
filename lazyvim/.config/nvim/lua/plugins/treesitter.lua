return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    vim.list_extend(opts.ensure_installed, {
      "typst",
      "nu",
      "powershell",
      "css",
      "latex",
    })
  end,
}
