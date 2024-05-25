return {
  {
    'VonHeikemen/lsp-zero.nvim',
    -- event = "BufReadPre",
    branch = 'v3.x',
    dependencies = {
      {'neovim/nvim-lspconfig'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/nvim-cmp'},
      {'L3MON4D3/LuaSnip'},
      {
        "j-hui/fidget.nvim",
        opts = {},
      }
    },
    config = function()
      local lsp_zero = require('lsp-zero')
      lsp_zero.extend_lspconfig()

      lsp_zero.on_attach(function(client, bufnr)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions
        lsp_zero.default_keymaps({buffer = bufnr})
      end)

      -- here you can setup the language servers
      require('lspconfig').ruff_lsp.setup({
        on_attach = function(client, bufnr)
          if client.name == 'ruff_lsp' then
            -- Disable hover in favor of Pyright
            client.server_capabilities.hoverProvider = false
          end
        end
      })
      require('lspconfig').pyright.setup({
        settings = {
          pyright = {
            -- Using Ruff's import organizer
            disableOrganizeImports = true,
          },
          python = {
            analysis = {
              -- Ignore all files for analysis to exclusively use Ruff for linting
              ignore = { '*' },
            },
          },
        },
      })
      require('lspconfig').clangd.setup({})
      require('lspconfig').marksman.setup({})
    end
  },
}
