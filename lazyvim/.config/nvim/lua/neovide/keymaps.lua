-- NOTE: Why this is not difined by default?
vim.keymap.set({ "n", "i" }, "<C-=>", function()
  vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1
end, { noremap = true, silent = true, desc = "Increase Neovide scale factor" })
vim.keymap.set({ "n", "i" }, "<C-->", function()
  vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1
end, { noremap = true, silent = true, desc = "Decrease Neovide scale factor" })
vim.keymap.set({ "n", "i" }, "<C-0>", function()
  vim.g.neovide_scale_factor = 1.0
end, { noremap = true, silent = true, desc = "Reset Neovide scale factor" })
