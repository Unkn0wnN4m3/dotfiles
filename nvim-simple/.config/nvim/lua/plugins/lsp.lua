return {
  {
    {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v3.x',
      lazy = true,
      config = false,
      init = function()
        vim.g.lsp_zero_extend_cmp = 0
        vim.g.lsp_zero_extend_lspconfig = 0
      end,
    },

    -- Autocompletion
    {
      'hrsh7th/nvim-cmp',
      event = 'InsertEnter',
      dependencies = {
        { 'L3MON4D3/LuaSnip' },
      },
      config = function()
        local lsp_zero = require('lsp-zero')
        lsp_zero.extend_cmp()

        local cmp = require('cmp')
        local cmp_action = lsp_zero.cmp_action()

        cmp.setup({
          preselect = 'item',
          completion = {
            completeopt = 'menu,menuone,noinsert'
          },
          formatting = lsp_zero.cmp_format({ details = true }),
          mapping = cmp.mapping.preset.insert({
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-u>'] = cmp.mapping.scroll_docs(-4),
            ['<C-d>'] = cmp.mapping.scroll_docs(4),
            ['<C-f>'] = cmp_action.luasnip_jump_forward(),
            ['<C-b>'] = cmp_action.luasnip_jump_backward(),
          }),
          snippet = {
            expand = function(args)
              require('luasnip').lsp_expand(args.body)
            end,
          },
        })
      end
    },

    -- LSP
    {
      'neovim/nvim-lspconfig',
      cmd = 'LspInfo',
      event = { 'BufReadPre', 'BufNewFile' },
      dependencies = {
        { 'hrsh7th/cmp-nvim-lsp' },
      },
      config = function()
        local lsp_zero = require('lsp-zero')
        lsp_zero.extend_lspconfig()

        lsp_zero.on_attach(function(client, bufnr)
          lsp_zero.default_keymaps({ buffer = bufnr })
        end)

        require('lspconfig').ruff_lsp.setup({
          on_attach = function(client, bufnr)
            if client.name == 'ruff_lsp' then
              -- Disable hover in favor of Pyright
              client.server_capabilities.hoverProvider = false
            end
          end,
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
        local lua_opts = lsp_zero.nvim_lua_ls()
        require('lspconfig').lua_ls.setup(lua_opts)
        require('lspconfig').clangd.setup({})
        require('lspconfig').marksman.setup({})
      end
    }
  },
  {
    "j-hui/fidget.nvim",
    event = "VeryLazy",
    opts = {
      notification = {
        window = {
          winblend = 0
        }
      }
    }
  }
}
