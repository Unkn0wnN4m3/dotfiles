vim.keymap.set("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })
vim.keymap.set("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })

vim.keymap.set("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
vim.keymap.set(
    "n",
    "<leader><tab>o",
    "<cmd>tabonly<cr>",
    { desc = "Close Other Tabs" }
)
vim.keymap.set(
    "n",
    "<leader><tab>f",
    "<cmd>tabfirst<cr>",
    { desc = "First Tab" }
)
vim.keymap.set(
    "n",
    "<leader><tab><tab>",
    "<cmd>tabnew<cr>",
    { desc = "New Tab" }
)
vim.keymap.set("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
vim.keymap.set(
    "n",
    "<leader><tab>d",
    "<cmd>tabclose<cr>",
    { desc = "Close Tab" }
)
vim.keymap.set(
    "n",
    "<leader><tab>[",
    "<cmd>tabprevious<cr>",
    { desc = "Previous Tab" }
)

local lsp_keys_group =
    vim.api.nvim_create_augroup("user_lsp_keys", { clear = true })
vim.api.nvim_create_autocmd("LspAttach", {
    group = lsp_keys_group,
    callback = function(event)
        local client = assert(vim.lsp.get_client_by_id(event.data.client_id))
        local bufnr = event.buf

        if
            client:supports_method(
                vim.lsp.protocol.Methods.textDocument_inlineCompletion,
                bufnr
            )
        then
            vim.lsp.inline_completion.enable(true, { bufnr = bufnr })

            vim.keymap.set(
                "i",
                "<C-F>",
                vim.lsp.inline_completion.get,
                { desc = "LSP: accept inline completion", buffer = bufnr }
            )
            vim.keymap.set(
                "i",
                "<C-G>",
                vim.lsp.inline_completion.select,
                { desc = "LSP: switch inline completion", buffer = bufnr }
            )
        end

        if client.name == "tinymist" then
            vim.keymap.set("n", "<leader>ce", function()
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

            vim.keymap.set("n", "<leader>uh", inlay_hint_toggle, {
                desc = "Toggle inlay hints",
                buffer = bufnr,
            })
        end
    end,
})
