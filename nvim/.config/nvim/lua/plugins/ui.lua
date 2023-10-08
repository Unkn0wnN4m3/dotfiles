return {
    {
        "svrana/neosolarized.nvim",
        version = "v1.0.*",
        lazy = false,
        priority = 1000,
        dependencies = {
            {
                "tjdevries/colorbuddy.nvim",
                commit = "cdb5b0654d3cafe61d2a845e15b2b4b0e78e752a"
            }
        },
        config = function()
            local n = require("neosolarized").setup({
                comment_italics = false,
                background_set = false,
            })

            local cb = require('colorbuddy.init')
            local Color = cb.Color

            Color.new('illmt', '#19404a')

            n.Group.new("CursorLineNr", n.colors.yellow, n.colors.none, n.styles.bold)
            n.Group.new("Function", n.colors.blue, n.colors.none, n.styles.bold)
            n.Group.new("Conditional", n.colors.green, n.colors.none, n.styles.italic)
            n.Group.new("Boolean", n.colors.green, n.colors.none, n.styles.italic)
            n.Group.new("IlluminatedWord", n.colors.none, n.colors.illmt, n.styles.none)
            n.Group.new("IlluminatedCurWord", n.colors.none, n.colors.illmt, n.styles.none)
            n.Group.new("IlluminatedWordText", n.colors.none, n.colors.illmt, n.styles.none)
            n.Group.new("IlluminatedWordRead", n.colors.none, n.colors.illmt, n.styles.none)
            n.Group.new("IlluminatedWordWrite", n.colors.none, n.colors.illmt, n.styles.none)
        end
    },
    {
        "akinsho/bufferline.nvim",
        version = "v4.*",
        event = "VeryLazy",
        config = function()
            require("bufferline").setup({
                options = {
                    mode = "tabs",
                    always_show_bufferline = false,
                    show_buffer_close_icons = false,
                    show_close_icon = false,
                    separator_style = { "|", "|" },
                },
            })
        end,
    },
    {
        "akinsho/toggleterm.nvim",
        version = "v2.*",
        event = "VeryLazy",
        keys = {
            { "<C-j>", [[<C-\><C-n><C-W>j]], mode = "t" },
            { "<C-k>", [[<C-\><C-n><C-W>k]], mode = "t" },
        },
        config = function()
            local toggleterm = require("toggleterm")
            local select_shell = vim.o.shell

            if vim.fn.has 'win32' == 1 then
                select_shell = "pwsh"
            end

            toggleterm.setup({
                open_mapping = [[<c-\>]],
                hide_numbers = true,
                shade_terminals = true,
                shading_factor = 2,
                start_in_insert = true,
                insert_mappings = true,
                persist_size = true,
                direction = "horizontal",
                close_on_exit = true,
                shell = select_shell
            })
        end
    },
    {
        'nvim-lualine/lualine.nvim',
        commit = "05d78e9fd0cdfb4545974a5aa14b1be95a86e9c9",
        config = function()
            local function mixedIndent()
                local space_indent = vim.fn.search([[\v^ +]], "nw") > 0
                local tab_indent = vim.fn.search([[\v^\t+]], "nw") > 0
                local mixed = (space_indent and tab_indent) or (vim.fn.search([[\v^(\t+ | +\t)]], "nw") > 0)
                return mixed and "MI" or ""
            end

            local function showIndent()
                local width = vim.o.shiftwidth
                if vim.o.expandtab then
                    return "spaces: " .. width
                else
                    return "tabs: " .. width
                end
            end

            require('lualine').setup({
                options = {
                    theme = "solarized",
                    section_separators = "",
                    component_separators = ""
                },
                sections = {
                    lualine_c = {
                        { mixedIndent, color = 'red' }
                    },
                    lualine_x = { showIndent, { 'fileformat', symbols = { unix = "lf", dos = "crlf" } }, 'encoding',
                        'filetype' },
                },
                extensions = {
                    'quickfix',
                    'toggleterm',
                    'man',
                    'fugitive',
                    'lazy',
                    'trouble'
                }
            })
        end
    },

    -- Style
    {
        "j-hui/fidget.nvim",
        tag = "legacy",
        event = "LspAttach",
        opts = {
            window = {
                blend = 0,
            },
        }
    },
    {
        "utilyre/barbecue.nvim",
        name = "barbecue",
        event = "VeryLazy",
        version = "v0.4.*",
        dependencies = {
            {
                "SmiteshP/nvim-navic",
                commit = "9c89730da6a05acfeb6a197e212dfadf5aa60ca0",
                opts = {
                    highlight = true
                }
            },
        },
        config = function()
            require("barbecue").setup({
                -- theme = "catppuccin",
                create_autocmd = false,
                attach_navic = false,
                show_modified = true,
                show_dirname = true,
                exclude_filetypes = { "netrw", "toggleterm" },

            })

            vim.api.nvim_create_autocmd({
                "BufWinEnter",
                "CursorHold",
                "InsertLeave",
            }, {
                group = vim.api.nvim_create_augroup("barbecue.updater", {}),
                callback = function()
                    require("barbecue.ui").update()
                end,
            })
        end
    },
    {
        "RRethy/vim-illuminate",
        commit = "a2907275a6899c570d16e95b9db5fd921c167502",
        event = "LspAttach",
        config = function()
            require('illuminate').configure({
                providers = {
                    'lsp'
                },
            })
        end
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        version = "v3.2.*",
        event = "VeryLazy",
        main = "ibl",
        opts = {
            whitespace = {
                remove_blankline_trail = true,
            },
            scope = { enabled = false },
        }
    },
    {
        "prichrd/netrw.nvim",
        commit = "596435bd2f5b0162b86c97ca8244e2b0862d3a4a",
        config = true
    }
}
