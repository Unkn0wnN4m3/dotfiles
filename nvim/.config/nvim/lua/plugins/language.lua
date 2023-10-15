return {
    {
        "sheerun/vim-polyglot",
        version = "v4.*",
        -- event = { 'BufReadPre', 'BufNewFile' },
        init = function()
            vim.g.polyglot_disabled = {
                "ftdetect",
                "markdown.plugin",
                "vim.plugin",
                "vimdoc.plugin",
                "lua.plugin",
                "c.plugin",
                "python.plugin",
                "javascript.plugin",
                "typescript.plugin",
                "html.plugin",
                "css.plugin",
                "json.plugin",
                "jsonc.plugin"
            }
        end
    },
    {
        "nvim-treesitter/nvim-treesitter",
        version = "v0.9.*",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "c",
                    "python",
                    "typescript",
                    "tsx",
                    "javascript",
                    "lua",
                    "vim",
                    "vimdoc",
                    "markdown",
                    "markdown_inline",
                    "latex",
                    "html",
                    "css",
                    "json",
                    "jsonc"
                },
                auto_install = false,
                highlight = {
                    enable = true,
                    disable = function(lang, buf)
                        local max_filesize = 100 * 1024 -- 100 KB
                        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                        if ok and stats and stats.size > max_filesize then
                            return true
                        end
                    end,
                },
            })
        end
    },
    {
        "iamcco/markdown-preview.nvim",
        ft = "markdown",
        version = "v0.0.*",
        -- build = "cd app && npm install",
        build = function()
            vim.fn["mkdp#util#install"]()
        end,
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
            vim.g.mkdp_echo_preview_url = 1
        end
    },
    {
        "mattn/emmet-vim",
        commit = "def5d57a1ae5afb1b96ebe83c4652d1c03640f4d",
        ft = {
            "html",
            "jinja.html",
            "htmldjango",
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
    },
    {
        "mhartington/formatter.nvim",
        commit = "34dcdfa0c75df667743b2a50dd99c84a557376f0",
        event = "LspAttach",
        config = function()
            require("formatter").setup({
                filetype = {
                    python = {
                        require("formatter.filetypes.python").yapf,
                        require("formatter.filetypes.python").isort,
                    },
                    c = {
                        require("formatter.filetypes.c").clangformat
                    }
                }
            })
        end
    }
}
