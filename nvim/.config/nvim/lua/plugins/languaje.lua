return {
    -- Language enhancements
    {
        'vim-python/python-syntax',
        commit = "2cc00ba72929ea5f9456a26782db57fb4cc56a65",
        ft = "python",
        config = function()
            vim.cmd([[
            let g:python_highlight_all = -1
            ]])
        end
    },
    {
        'Vimjas/vim-python-pep8-indent',
        ft = "python",
        commit = "60ba5e11a61618c0344e2db190210145083c91f8"
    },
    {
        "HerringtonDarkholme/yats.vim",
        ft = { "typescript", "typescriptreact" },
        commit = "4bf3879055847e675335f1c3050bd2dd11700c7e"
    },
    {
        "pangloss/vim-javascript",
        ft = { "javascript", "javascriptreact" },
        tag = "v1.2.2"
    },
    {
        "tbastos/vim-lua",
        ft = "lua",
        commit = "fa810f85437525bcea0fc4ff22c634935721d86d"
    },
}
