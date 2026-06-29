local function map(mode, lhs, rhs, opts)
    local options = { silent = true, noremap = true }

    if opts then
        options = vim.tbl_extend("force", options, opts)
    end

    vim.keymap.set(mode, lhs, rhs, options)
end

map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })

map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
map("n", "<leader><tab>o", "<cmd>tabonly<cr>", { desc = "Close Other Tabs" })
map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Delete Buffer" })
map("n", "<leader>bp", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<leader>bn", "<cmd>bnext<cr>", { desc = "Next Buffer" })

map("n", "<leader>us", function()
    vim.opt_local.spell = not vim.opt_local.spell:get()
end, {
    desc = "Toggle spell check",
})

map({ "i", "n", "s" }, "<esc>", function()
    vim.cmd("noh")
    return "<esc>"
end, { expr = true, desc = "Escape and Clear hlsearch" })

map("n", "<leader>e", "<cmd>Lexplore<cr>", { desc = "File Explorer" })

local lsp_keys_group =
    vim.api.nvim_create_augroup("user_lsp_keys", { clear = true })
vim.api.nvim_create_autocmd("LspAttach", {
    group = lsp_keys_group,
    callback = function(event)
        local client = assert(vim.lsp.get_client_by_id(event.data.client_id))
        local bufnr = event.buf

        -- if
        --     client:supports_method(
        --         vim.lsp.protocol.Methods.textDocument_inlineCompletion,
        --         bufnr
        --     )
        -- then
        --     vim.lsp.inline_completion.enable(true, { bufnr = bufnr })
        --
        --     map(
        --         "i",
        --         "<C-F>",
        --         vim.lsp.inline_completion.get,
        --         { desc = "LSP: accept inline completion", buffer = bufnr }
        --     )
        --     map(
        --         "i",
        --         "<C-G>",
        --         vim.lsp.inline_completion.select,
        --         { desc = "LSP: switch inline completion", buffer = bufnr }
        --     )
        -- end

        if client.name == "tinymist" then
            map("n", "<leader>ce", function()
                vim.cmd("LspTinymistExportPdf")
            end, { buffer = bufnr, desc = "Export document to PDF" })
        end

        if
            client:supports_method(
                vim.lsp.protocol.Methods.textDocument_inlayHint,
                bufnr
            )
        then
            local inlay_hint_toggle = function()
                vim.lsp.inlay_hint.enable(
                    not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }),
                    { bufnr = bufnr }
                )
            end

            map("n", "<leader>uh", inlay_hint_toggle, {
                desc = "Toggle inlay hints",
                buffer = bufnr,
            })
        end
    end,
})
