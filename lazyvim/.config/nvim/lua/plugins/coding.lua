return {
  {
    "saghen/blink.cmp",
    opts = function(_, opts)
      opts.keymap.preset = "default"
      opts.completion.documentation.window =
        vim.tbl_deep_extend("force", opts.completion.documentation.window or {}, { border = "rounded" })
    end,
  },
  {
    "tpope/vim-fugitive",
    event = "VeryLazy",
  },
}
