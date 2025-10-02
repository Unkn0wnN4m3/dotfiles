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
        texlab = {
          settings = {
            texlab = {
              forwardSearch = {
                executable = "okular",
                args = { "--unique", "file:%p#src:%l%f" },
              },
              chktex = {
                onEdit = false,
                onOpenAndSave = true,
              },
            },
          },
        },
      },
    },
  },
  {
    "ravibrock/spellwarn.nvim",
    commit = "12734b47b008d912b4925c0bc2c1248eb534409d",
    event = "VeryLazy",
    opts = {
      max_file_size = 1000,
    },
  },
}
