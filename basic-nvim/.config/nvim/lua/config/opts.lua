vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local opt = vim.opt

opt.confirm = true
opt.pumblend = 10
opt.pumheight = 10
opt.scrolloff = 8
opt.sidescrolloff = 12
-- opt.shortmess:append({ W = true, I = true, c = true, C = true })
opt.spelllang = { "en", "es" }
opt.wildmode = "longest:full,full"
opt.wrap = false
opt.virtualedit = "block"
opt.updatetime = 200
opt.winborder = "rounded"
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.HINT] = "󱧡",
            [vim.diagnostic.severity.INFO] = "",
        },
    },
    virtual_text = {
        prefix = "",
        severity = {
            min = vim.diagnostic.severity.WARN,
            max = vim.diagnostic.severity.ERROR,
        },
        source = "if_many",
    },
    severity_sort = true,
    jump = {
        on_jump = function()
            vim.diagnostic.open_float({ scope = "cursor", focus = false })
        end,
    },
})

if vim.fn.has("win32") == 1 then
    require("windows.opts")
end
