return {
    {
        "rose-pine/neovim",
        name = 'rose-pine',
        lazy = false,    -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        tag = "v1.1.0",
        config = function()
            -- load the colorscheme here
            require("rose-pine").setup({
                disable_italics = true,
                dark_variant = 'moon',
                disable_background = false,
            })
            vim.cmd('colorscheme rose-pine')
        end,
    },
    -- {
    --     "folke/tokyonight.nvim",
    --     lazy = false, -- make sure we load this during startup if it is your main colorscheme
    --     priority = 1000, -- make sure to load this before all the other start plugins
    --     tag = "v1.0.0",
    --     config = function()
    --         -- load the colorscheme here
    --         require("tokyonight").setup({
    --             style = "moon",
    --             transparent = true
    --         })
    --         vim.cmd('colorscheme tokyonight')
    --     end,
    -- },
    {
        "akinsho/bufferline.nvim",
        tag = "v3.1.0",
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
                highlights = {
                    buffer_selected = {
                        bold = true,
                    },
                },
            })
        end,
    },
    {
        "akinsho/toggleterm.nvim",
        tag = "v2.2.1",
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

            -- local navic = require("nvim-navic")

            require('lualine').setup({
                options = {
                    theme = 'rose-pine-alt'
                },
                sections = {
                    lualine_c = {
                        { 'filename',  path = 0 },
                        { mixedIndent, color = 'red' }
                    },
                    lualine_x = { 'o:shiftwidth', 'encoding', 'fileformat', 'filetype' },
                },
                -- winbar = {
                --     lualine_c = {
                --         { navic.get_location, cond = navic.is_avaible }
                --     }
                -- },
                extensions = {
                    'quickfix',
                    'toggleterm',
                }
            })
        end
    }
}
