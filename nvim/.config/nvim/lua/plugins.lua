--[[ ====================================================
    ____  / /_  ______ _(_)___  _____  / /_  ______ _
   / __ \/ / / / / __ `/ / __ \/ ___/ / / / / / __ `/
  / /_/ / / /_/ / /_/ / / / / (__  ) / / /_/ / /_/ /
 / .___/_/\__,_/\__, /_/_/ /_/____(_)_/\__,_/\__,_/
/_/            /____/
========================================================= ]]

return {
    -- utilities
    {
        "nvim-tree/nvim-web-devicons",
        lazy = false
    },
    {
        "nvim-lua/plenary.nvim",
        tag = "v0.1.2"
    },

    -- Themes
    {
        "folke/tokyonight.nvim",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        tag = "v1.0.0",
        config = function()
            -- load the colorscheme here
            require("tokyonight").setup({
                style = "moon",
                transparent = false
            })
            vim.cmd([[colorscheme tokyonight]])
        end,
    },
    {
        "feline-nvim/feline.nvim",
        tag = "v1.1.3",
    },
    {
        "akinsho/bufferline.nvim",
        tag = "v3.1.0"
    },
    {
        "akinsho/toggleterm.nvim",
        tag = "v2.2.1"
    },
    {
        "folke/trouble.nvim",
        tag = "v1.0.0"
    },
    {
        "numToStr/Comment.nvim",
        tag = "v0.7.0",
        config = true
    },
    {
        "windwp/nvim-autopairs",
        commit = "f00eb3b766c370cb34fdabc29c760338ba9e4c6c",
        config = true
    },

    -- File management
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.0"
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        commit = "304508fb7bea78e3c0eeddd88c4837501e403ae8"
    },
    {
        "nvim-telescope/telescope-project.nvim",
        commit = "8e8ee37b7210761502cdf2c3a82b5ba8fb5b2972"
    },

    -- Git
    {
        "lewis6991/gitsigns.nvim",
        tag = "v0.6",
        config = true
    },

    -- Lsp
    {
        'VonHeikemen/lsp-zero.nvim',
        commit = "d91485ced9fd2be49a989e58de566446451bc41b",
        dependencies = {
            -- LSP Support
            {
                'neovim/nvim-lspconfig',
                tag = "v0.1.5"
            }, -- Required
            {
                'williamboman/mason.nvim',
                commit = "5e78970539d937b7aef7a4e10b219d60da0b1425"
            }, -- Optional
            {
                'williamboman/mason-lspconfig.nvim',
                commit = "610f5919fe633ac872239a0ab786572059f0d91d"
            }, -- Optional
            {
                'jose-elias-alvarez/null-ls.nvim',
                commit = '7bd74a821d991057ca1c0ca569d8252c4f89f860'
            },

            -- Autocompletion
            {
                'hrsh7th/nvim-cmp',
                tag = "v0.0.1"
            }, -- Required
            {
                'hrsh7th/cmp-nvim-lsp',
                commit = "59224771f91b86d1de12570b4070fe4ad7cd1eeb",
            }, -- Required
            {
                'hrsh7th/cmp-buffer',
                commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa",
            }, -- Optional
            {
                'hrsh7th/cmp-path',
                commit = "91ff86cd9c29299a64f968ebb45846c485725f23",
            }, -- Optional
            {
                'saadparwaiz1/cmp_luasnip',
                commit = "18095520391186d634a0045dacaa346291096566",
            }, -- Optional
            {
                'hrsh7th/cmp-nvim-lua',
                commit = "f3491638d123cfd2c8048aefaf66d246ff250ca6",
            }, -- Optional

            -- Snippets
            {
                'L3MON4D3/LuaSnip',
                tag = "v1.1.0",
            }, -- Required
            {
                'rafamadriz/friendly-snippets',
                commit = "320865dfe76c03a5c60513d4f34ca22effae56f2",
            }, -- Optional
        },
    },

    -- Language enhancements
    {
        'vim-python/python-syntax',
        commit = "2cc00ba72929ea5f9456a26782db57fb4cc56a65",
        config = function()
            vim.cmd([[
            let g:python_highlight_all = 1
            ]])
        end
    },
    {
        "HerringtonDarkholme/yats.vim",
        commit = "4bf3879055847e675335f1c3050bd2dd11700c7e"
    },
    {
        "pangloss/vim-javascript",
        tag = "v1.2.2"
    },
}
