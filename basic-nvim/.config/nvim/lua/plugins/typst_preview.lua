return {
    "chomosuke/typst-preview.nvim",
    version = "1.*",
    opts = function()
        local custom_cmd = function()
            if vim.fn.has("win32") == 1 then
                return "start msedge --app=%s"
            else
                return nil
            end
        end

        return {
            open_cmd = custom_cmd(),
            dependencies_bin = {
                tinymist = (vim.fn.has("win32") == 1) and "tinymist.cmd"
                    or "tinymist",
                websocat = nil,
            },
        }
    end,
    keys = {
        {
            "<leader>cp",
            "<cmd>TypstPreviewToggle<cr>",
            ft = "typst",
            mode = "n",
            desc = "Toggle Typst Preview",
        },
    },
}
