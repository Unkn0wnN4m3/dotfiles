return {
    -- Language enhancements
    {
        'vim-python/python-syntax',
        commit = "2cc00ba72929ea5f9456a26782db57fb4cc56a65",
        ft = "python",
        init = function()
            vim.cmd([[
            let g:python_highlight_all = 1
            ]])
        end,
        dependencies = {
            {
                'Vimjas/vim-python-pep8-indent',
                commit = "60ba5e11a61618c0344e2db190210145083c91f8"
            },
        }
    },
    {
        'Glench/Vim-Jinja2-Syntax',
        ft = { "html", "jinja.html" },
        commit = '2c17843b074b06a835f88587e1023ceff7e2c7d1'
    },
    {
        "HerringtonDarkholme/yats.vim",
        ft = { "typescript", "typescriptreact" },
        commit = "1be1f3afc06108d210a7725217f9a1e50f93808f"
    },
    {
        "pangloss/vim-javascript",
        ft = { "javascript", "javascriptreact" },
        tag = "v1.2.2",
        dependencies = {
            {
                "neoclide/vim-jsx-improve",
                tag = "0.0.1"
            },

        }
    },
    {
        "neoclide/jsonc.vim",
        ft = { "json", "jsonc" },
        commit = "6fb92460f9e50505c9b93181a00f27d10c9b383f"
    },
    {
        "tbastos/vim-lua",
        ft = "lua",
        commit = "fa810f85437525bcea0fc4ff22c634935721d86d"
    },
    {
        "iamcco/markdown-preview.nvim",
        ft = "markdown",
        tag = "v0.0.10",
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
