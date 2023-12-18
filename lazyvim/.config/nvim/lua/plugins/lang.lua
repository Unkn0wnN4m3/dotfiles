return {
  {
    "nvim-neorg/neorg",
    -- version = "v6.*",
    build = ":Neorg sync-parsers",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("neorg").setup({
        load = {
          ["core.defaults"] = {}, -- Loads default behaviour
          ["core.concealer"] = {}, -- Adds pretty icons to your documents
          ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                work = "~/neorg/work",
                school = "~/neorg/school",
                dev = "~/neorg/dev",
                notes = "~/neorg/notes",
              },
              default_workspace = "notes",
            },
          },
          ["core.completion"] = { config = { engine = "nvim-cmp" } },
        },
      })
    end,
  },
  {
    "nvim-java/nvim-java",
    dependencies = {
      "nvim-java/lua-async-await",
      "nvim-java/nvim-java-core",
      "nvim-java/nvim-java-test",
      "nvim-java/nvim-java-dap",
      "MunifTanjim/nui.nvim",
      "neovim/nvim-lspconfig",
      "mfussenegger/nvim-dap",
      {
        "williamboman/mason.nvim",
        opts = {
          registries = {
            "github:nvim-java/mason-registry",
            "github:mason-org/mason-registry",
          },
        },
      },
      {
        "williamboman/mason-lspconfig.nvim",
        opts = {
          handlers = {
            ["jdtls"] = function()
              require("java").setup()
            end,
          },
        },
      },
    },
    opts = {},
  },
}
