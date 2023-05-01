return {
    {
        'Glench/Vim-Jinja2-Syntax',
        ft = { "html", "jinja.html" },
        commit = '2c17843b074b06a835f88587e1023ceff7e2c7d1'
    },
    {
        "sheerun/vim-polyglot",
        version = "v4.*",
    },
    {
        "iamcco/markdown-preview.nvim",
        ft = "markdown",
        version = "v0.*",
        build = "cd app && npm install",
        init = function() vim.g.mkdp_filetypes = { "markdown" } end
    },
    {
        "mattn/emmet-vim",
        commit = "def5d57a1ae5afb1b96ebe83c4652d1c03640f4d",
        ft = {
            "html",
            "jinja.html",
            "javascriptreact",
            "typescriptreact",
            "javascript",
            "typescript"
        },
        init = function()
            vim.cmd([[
           let g:user_emmet_leader_key='<C-Z>'
           ]])
        end
    }
}
