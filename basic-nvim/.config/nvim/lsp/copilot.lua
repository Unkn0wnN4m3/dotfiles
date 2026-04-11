local lsp_grp = vim.api.nvim_create_augroup("copilot-keymaps", { clear = true })

vim.api.nvim_create_autocmd("LspAttach", {
    group = lsp_grp,
    callback = function(args)
        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        if client and client.name == "copilot" then
            -- Enable inline completion for Copilot
            vim.lsp.inline_completion.enable()

            vim.keymap.set(
                'i',
                '<C-F>',
                vim.lsp.inline_completion.get,
                { desc = 'LSP: accept inline completion', buffer = bufnr }
            )
            vim.keymap.set(
                'i',
                '<C-G>',
                vim.lsp.inline_completion.select,
                { desc = 'LSP: switch inline completion', buffer = bufnr }
            )
        end
    end,
})

local function sign_in(bufnr, client)
    client:request(
    ---@diagnostic disable-next-line: param-type-mismatch
        'signIn',
        vim.empty_dict(),
        function(err, result)
            if err then
                vim.notify(err.message, vim.log.levels.ERROR)
                return
            end
            if result.command then
                local code = result.userCode
                local command = result.command
                vim.fn.setreg('+', code)
                vim.fn.setreg('*', code)
                local continue = vim.fn.confirm(
                    'Copied your one-time code to clipboard.\n' ..
                    'Open the browser to complete the sign-in process?',
                    '&Yes\n&No'
                )
                if continue == 1 then
                    client:exec_cmd(command, { bufnr = bufnr }, function(cmd_err, cmd_result)
                        if cmd_err then
                            vim.notify(cmd_err.message, vim.log.levels.ERROR)
                            return
                        end
                        if cmd_result.status == 'OK' then
                            vim.notify('Signed in as ' .. cmd_result.user .. '.')
                        end
                    end)
                end
            end

            if result.status == 'PromptUserDeviceFlow' then
                vim.notify('Enter your one-time code ' ..
                    result.userCode .. ' in ' .. result.verificationUri)
            elseif result.status == 'AlreadySignedIn' then
                vim.notify('Already signed in as ' .. result.user .. '.')
            end
        end
    )
end

---@param client vim.lsp.Client
local function sign_out(_, client)
    client:request(
    ---@diagnostic disable-next-line: param-type-mismatch
        'signOut',
        vim.empty_dict(),
        function(err, result)
            if err then
                vim.notify(err.message, vim.log.levels.ERROR)
                return
            end
            if result.status == 'NotSignedIn' then
                vim.notify('Not signed in.')
            end
        end
    )
end

return {
    on_attach = function(client, bufnr)
        vim.api.nvim_buf_create_user_command(bufnr, 'LspCopilotSignIn', function()
            sign_in(bufnr, client)
        end, { desc = 'Sign in Copilot with GitHub' })
        vim.api.nvim_buf_create_user_command(bufnr, 'LspCopilotSignOut', function()
            sign_out(bufnr, client)
        end, { desc = 'Sign out Copilot with GitHub' })
    end,
}
