-- Reset to vertical cursor when leave nvim on windws
if vim.fn.has("win32") or vim.fn.has("win64") then
  local userAU_resetcursor = vim.api.nvim_create_augroup("userAU_resetcursor", { clear = true })
  vim.api.nvim_create_autocmd("VimLeavePre", {
    desc = "Reset cursor from block to beam",
    group = userAU_resetcursor,
    callback = function()
      -- vim.opt.guicursor = "a:ver10-blinkon1"
      vim.api.nvim_set_option_value("guicursor", "a:ver10-blinkon1", { scope = "local" })
    end,
  })
end
