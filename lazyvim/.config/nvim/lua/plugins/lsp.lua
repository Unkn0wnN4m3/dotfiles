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
            lint = {
              enabled = true,
              when = "onSave",
            },
            preview = {
              background = {
                enabled = true,
                args = { "--data-plane-host=127.0.0.1:23635", "--invert-colors=never", "--open" },
              },
            },
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
