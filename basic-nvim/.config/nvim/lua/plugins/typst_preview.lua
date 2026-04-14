local custom_cmd = function()
    if vim.fn.has("win32") == 1 then
        return "start msedge --app=%s"
    else
        return nil
    end
end

return {
    "chomosuke/typst-preview.nvim",
    ft = "typst",
    version = "1.*",
    opts = function()
        vim.keymap.set("n", "<leader>cp", "<cmd>TypstPreviewToggle<cr>", { desc = "Toggle Typst preview" })

        return {
            open_cmd = custom_cmd(),
            dependencies_bin = {
                tinymist = "tinymist",
                websocat = nil,
            },
        }
    end,
}
