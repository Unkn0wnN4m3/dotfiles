-- For solarized colorscheme

vim.g.solarized_italics = 0
vim.g.solarized_termtrans = 1

-- Set colorscheme

local colorscheme = "solarized-high"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	return
end
