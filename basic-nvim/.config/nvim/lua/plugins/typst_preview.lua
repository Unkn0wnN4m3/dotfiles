return {
    'chomosuke/typst-preview.nvim',
    ft = "typst",
    version = '1.*',
    opts = {
        dependencies_bin = {
            tinymist = "tinymist",
            websocat = nil
        },
    },
    keys = {
        { "<leader>cp", "<cmd>TypstPreviewToggle<cr>", desc = "Toggle Typst Preview" },
    },
}
