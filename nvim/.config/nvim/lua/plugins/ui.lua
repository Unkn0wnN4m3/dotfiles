return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        priority = 1000,
        version = "v1.*",
        config = function()
            require("catppuccin").setup({
                flavour = "frappe",
                -- :h background
                background = {
                    light = "latte",
                    dark = "frappe",
                },
                -- no_italic = true,
                dim_inactive = {
                    enabled = true,
                    shade = "dark",
                    percentage = 0.15,
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
                },
            })
            vim.cmd.colorscheme "catppuccin"
        end
    },
    {
        "akinsho/bufferline.nvim",
        version = "v4.*",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function()
            require("bufferline").setup({
                options = {
                    mode = "tabs",
                    always_show_bufferline = false,
                    show_buffer_close_icons = false,
                    show_close_icon = false,
                    color_icons = true,
                    close_command = "bdelete",       -- can be a string | function, see "Mouse actions"
                    right_mouse_command = "bdelete", -- can be a string | function, see "Mouse actions"
                    separator_style = { "|", "|" },  -- | "thick" | "thin" | { 'any', 'any' },
                    indicator = {
                        style = "none",
                    },
                },
                highlights = require("catppuccin.groups.integrations.bufferline").get()
            })
        end,
    },
    {
        "akinsho/toggleterm.nvim",
        version = "v2.*",
        keys = {
            { "<C-t>", "<CMD>ToggleTerm<CR>", mode = { "n", "t" } },
            { "<C-j>", [[<C-\><C-n><C-W>j]],  mode = "t" },
            { "<C-k>", [[<C-\><C-n><C-W>k]],  mode = "t" },
        },
        config = function()
            local toggleterm = require("toggleterm")
            local select_shell = vim.o.shell

            if vim.fn.has 'win32' == 1 then
                select_shell = "pwsh"
            end

            toggleterm.setup({
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
        commit = "0050b308552e45f7128f399886c86afefc3eb988",
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
                        { 'filename',  path = 0 },
                        { mixedIndent, color = 'red' }
                    },
                    lualine_x = { 'o:shiftwidth', 'encoding', 'fileformat', 'filetype' },
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
        version = "v0.4.*",
        dependencies = {
            {
                "SmiteshP/nvim-navic",
                commit = "cdd24539bcf114a499827e9b32869fe74836efe7",
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
    }
}
