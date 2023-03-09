return {
    -- Language enhancements
    {
        'vim-python/python-syntax',
        commit = "2cc00ba72929ea5f9456a26782db57fb4cc56a65",
        ft = "python",
        config = function()
            vim.cmd([[
            let g:python_highlight_all = 1
            ]])
        end
    },
    {
        'Vimjas/vim-python-pep8-indent',
        ft = "python",
        commit = "60ba5e11a61618c0344e2db190210145083c91f8"
    },
    {
        'Glench/Vim-Jinja2-Syntax',
        ft = { "html", "jinja.html" },
        commit = '2c17843b074b06a835f88587e1023ceff7e2c7d1'
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
    {
        "evanleck/vim-svelte",
        ft = "svelte",
        commit = "0e93ec53c3667753237282926fec626785622c1c",
        dependencies = {
            {
                "othree/html5.vim",
                tag = "0.27"
            },
            {
                "pangloss/vim-javascript",
                tag = "v1.2.2"
            }
        }
    }
}
