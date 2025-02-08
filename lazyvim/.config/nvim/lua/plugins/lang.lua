return {
  -- python
  {
    "linux-cultist/venv-selector.nvim",
    ft = "python",
    dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
    opts = {
      -- name = { "venv", ".venv" },
    },
    keys = {
      { "<leader>fv", "<cmd>VenvSelect<cr>" },
      { "<leader>fV", "<cmd>VenvSelectCached<cr>" },
    },
  },
}
