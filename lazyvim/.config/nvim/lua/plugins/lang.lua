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
}
