return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      -- opts.diagnostics.virtual_text = { prefix = "󰆦" }
      -- opts.diagnostics.virtual_lines = { current_line = true }

      table.insert(opts.servers, {
        tinymist = {
          settings = {
            formatterMode = "typstyle",
            exportPdf = "onSave",
            semanticTokens = "disable",
          },
        },
      })
    end,
  },
}
