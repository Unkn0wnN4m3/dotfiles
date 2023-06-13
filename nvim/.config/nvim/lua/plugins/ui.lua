return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        priority = 1000,
        version = "v1.*",
        config = function()
            require("catppuccin").setup({
                -- :h background
                background = {
                    light = "latte",
                    dark = "mocha",
                },
                -- no_italic = true,
                dim_inactive = {
                    enabled = true,
                    shade = "dark",
                    percentage = 0.15,
                },
                styles = {
                    comments = { "italic" },
                    conditionals = { "italic" },
                    loops = { "bold" },
                    functions = { "bold" },
                    keywords = { "bold" },
                    strings = {},
                    variables = {},
                    numbers = { "bold" },
                    booleans = { "italic" },
                    properties = {},
                    types = { "bold" },
                    operators = {},
                },
                integrations = {
                    cmp = true,
                    gitsigns = true,
                    telescope = true,
                    markdown = true,
                    mason = true,
                    illuminate = true,
                    barbecue = {
                        dim_dirname = true,
                        bold_basename = true,
                        dim_context = false,
                    },
                    navic = {
                        enabled = false,
                        custom_bg = "NONE",
                    },
                    fidget = true,
                    native_lsp = {
                        enabled = true,
                        underlines = {
                            errors = { "underline" },
                            hints = { "underline" },
                            warnings = { "underline" },
                            information = { "underline" },
                        },
                    },
                    leap = false
                },
            })
            vim.cmd.colorscheme "catppuccin"
        end
    },
    {
        "akinsho/bufferline.nvim",
        version = "v4.*",
        dependencies = "nvim-tree/nvim-web-devicons",
        event = "BufReadPre",
        config = function()
            require("bufferline").setup({
                options = {
                    mode = "tabs",
                    always_show_bufferline = false,
                    show_buffer_close_icons = false,
                    show_close_icon = false,
                    separator_style = { "|", "|" }, -- | "thick" | "thin" | { 'any', 'any' },
                    -- indicator = {
                    --     style = "none",
                    -- },
                },
                highlights = require("catppuccin.groups.integrations.bufferline").get()
            })
        end,
    },
    {
        "akinsho/toggleterm.nvim",
        version = "v2.*",
        event = "BufReadPre",
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
        dependencies = 'nvim-tree/nvim-web-devicons',
        commit = "05d78e9fd0cdfb4545974a5aa14b1be95a86e9c9",
        config = function()
            local function mixedIndent()
                local space_indent = vim.fn.search([[\v^ +]], "nw") > 0
                local tab_indent = vim.fn.search([[\v^\t+]], "nw") > 0
                local mixed = (space_indent and tab_indent) or (vim.fn.search([[\v^(\t+ | +\t)]], "nw") > 0)
                return mixed and "MI" or ""
            end

            require('lualine').setup({
                options = {
                    theme = "catppuccin"
                },
                sections = {
                    lualine_c = {
                        { mixedIndent, color = 'red' }
                    },
                    lualine_x = { 'o:shiftwidth', 'encoding', { 'fileformat', symbols = { unix = "LF", dos = "CRLF" } },
                        'filetype' },
                },
                extensions = {
                    'quickfix',
                    'toggleterm',
                    'man',
                }
            })
        end
    },

    -- Style
    {
        "j-hui/fidget.nvim",
        commit = "0ba1e16d07627532b6cae915cc992ecac249fb97",
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
        event = "BufReadPre",
        version = "v0.4.*",
        dependencies = {
            {
                "SmiteshP/nvim-navic",
                commit = "15704c607569d6c5cfeab486d3ef9459645a70ce",
                opts = {
                    highlight = true
                }
            },
            { "nvim-tree/nvim-web-devicons" }
        },
        config = function()
            require("barbecue").setup({
                theme = "catppuccin",
                create_autocmd = false,
                attach_navic = false,
                show_modified = true,
                show_dirname = false,
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
                    'lsp',
                },
            })
        end
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        version = "v2.*",
        event = "BufReadPre",
        opts = {
            show_end_of_line = true,
            show_first_indent_level = true,
            show_trailing_blankline_indent = false
        }
    }
}
