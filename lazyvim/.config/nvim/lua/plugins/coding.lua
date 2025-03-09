return {
  {
    "saghen/blink.cmp",
    opts = function(_, opts)
      opts.keymap.preset = "default"
    end,
  },
  {
    "tpope/vim-fugitive",
    event = "LazyFile",
  },
}
