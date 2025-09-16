return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "typst",
        "nu",
        "powershell",
        "css",
        "latex",
      })
    end,
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    init = function()
      vim.g.rainbow_delimiters = {
        strategy = {
          [""] = function(bufnr)
            -- Disabled for very large files, global strategy for large files,
            -- local strategy otherwise
            local line_count = vim.api.nvim_buf_line_count(bufnr)
            if line_count > 10000 then
              return nil
            else
              return "rainbow-delimiters.strategy.global"
            end
          end,
        },
      }
    end,
  },
}
