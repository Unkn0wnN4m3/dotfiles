return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      checkbox = {
        enabled = true,
      },
    },
  },
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    -- event = {
    --   "BufReadPre " .. vim.fn.expand("~") .. "\\Proton Drive\\main\\My files\\Vaults\\School\\*.md",
    --   "BufReadPre " .. vim.fn.expand("~") .. "\\Proton Drive\\main\\My files\\Vaults\\Personal\\*.md",
    -- },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      workspaces = {
        {
          name = "personal",
          path = vim.fn.expand("~") .. "\\Proton Drive\\main\\My files\\Vaults\\Personal",
        },
        {
          name = "school",
          path = vim.fn.expand("~") .. "\\Proton Drive\\main\\My files\\Vaults\\School",
        },
      },
      mappings = {},
      picker = {
        name = "fzf-lua",
        note_mappings = {
          new = "<C-x>",
          insert_link = "<C-l>",
        },
        tag_mappings = {
          tag_note = "<C-x>",
          insert_tag = "<C-l>",
        },
      },
      ui = { enable = false },
    },
  },
}
