return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tinymist = {
          settings = {
            formatterMode = "typstyle",
            exportPdf = "onSave",
            semanticTokens = "disable",
          },
        },
      },
    },
  },
  { "mason-org/mason.nvim", version = "v1.*" },
  { "mason-org/mason-lspconfig.nvim", version = "v1.*" },
}
