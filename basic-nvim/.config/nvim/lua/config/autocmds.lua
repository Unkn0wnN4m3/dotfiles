local function augroup(name)
    return vim.api.nvim_create_augroup("user_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("BufReadPost", {
    group = augroup("last_loc"),
    callback = function(event)
        local exclude = { "gitcommit" }
        local buf = event.buf
        if vim.tbl_contains(exclude, vim.bo[buf].filetype) then
            return
        end
        local mark = vim.api.nvim_buf_get_mark(buf, '"')
        local lcount = vim.api.nvim_buf_line_count(buf)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    group = augroup("man_unlisted"),
    pattern = { "man" },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
    end,
})

local spell_ft = require("spell_filetypes")

vim.api.nvim_create_autocmd("FileType", {
    group = augroup("wrap_spell"),
    -- pattern = { "text", "plaintex", "typst", "gitcommit", "markdown" },
    pattern = spell_ft.filetypes,
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.spell = true
    end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
    group = augroup("json_conceal"),
    pattern = { "json", "jsonc", "json5" },
    callback = function()
        vim.opt_local.conceallevel = 0
    end,
})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    group = augroup("auto_create_dir"),
    callback = function(event)
        if event.match:match("^%w%w+:[\\/][\\/]") then
            return
        end
        local file = vim.uv.fs_realpath(event.match) or event.match
        vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
    end,
})

-- From kickstart.nvim
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("user-lsp-attach", { clear = true }),
    callback = function(event)
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if
            client
            and client:supports_method(
                "textDocument/documentHighlight",
                event.buf
            )
        then
            local highlight_augroup = vim.api.nvim_create_augroup(
                "user-lsp-highlight",
                { clear = false }
            )
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                buffer = event.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                buffer = event.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd("LspDetach", {
                group = vim.api.nvim_create_augroup(
                    "user-lsp-detach",
                    { clear = true }
                ),
                callback = function(event2)
                    vim.lsp.buf.clear_references()
                    vim.api.nvim_clear_autocmds({
                        group = "user-lsp-highlight",
                        buffer = event2.buf,
                    })
                end,
            })
        end
    end,
})
