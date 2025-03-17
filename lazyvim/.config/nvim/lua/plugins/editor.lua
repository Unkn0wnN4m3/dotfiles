return {
  { "tiagovla/scope.nvim", config = true },
  {
    "ibhagwan/fzf-lua",
    keys = {
      { "<leader>fz", "<cmd>FzfLua zoxide<cr>", desc = "Jump directories using zoxide" },
    },
  },
}
