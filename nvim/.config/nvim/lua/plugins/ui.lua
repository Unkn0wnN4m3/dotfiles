return {
    -- {
    --     "svrana/neosolarized.nvim",
    --     version = "v1.*",
    --     lazy = false,
    --     priority = 1000,
    --     dependencies = {
    --         {
    --             "tjdevries/colorbuddy.nvim",
    --             commit = "cdb5b0654d3cafe61d2a845e15b2b4b0e78e752a",
    --         },
    --     },
    --     config = function()
    --         local n = require("neosolarized").setup({
    --             comment_italics = false,
    --             background_set = false,
    --         })

    --         local cb = require("colorbuddy.init")
    --         local Color = cb.Color

    --         Color.new("illmt", "#19404a")

    --         n.Group.new("CursorLineNr", n.colors.yellow, n.colors.none, n.styles.bold)
    --         n.Group.new("Function", n.colors.blue, n.colors.none, n.styles.bold)
    --         n.Group.new("Conditional", n.colors.green, n.colors.none, n.styles.italic)
    --         n.Group.new("Boolean", n.colors.green, n.colors.none, n.styles.italic)
    --         n.Group.new("IlluminatedWord", n.colors.none, n.colors.illmt, n.styles.none)
    --         n.Group.new("IlluminatedCurWord", n.colors.none, n.colors.illmt, n.styles.none)
    --         n.Group.new("IlluminatedWordText", n.colors.none, n.colors.illmt, n.styles.none)
    --         n.Group.new("IlluminatedWordRead", n.colors.none, n.colors.illmt, n.styles.none)
    --         n.Group.new("IlluminatedWordWrite", n.colors.none, n.colors.illmt, n.styles.none)
    --         n.Group.new("Visual", n.colors.none, n.colors.base03, n.styles.reverse)
    --     end,
    -- },
    {
        "ellisonleao/gruvbox.nvim",
        version = "2.*",
        lazy = false,
        priority = 1000,
        config = function()
            require("gruvbox").setup({
                terminal_colors = true,
                invert_selection = true,
                transparent_mode = true,
                italic = {
                    strings = false,
                },
            })

            vim.cmd.colorscheme("gruvbox")
        end,
    },
    {
        "akinsho/toggleterm.nvim",
        version = "v2.*",
        event = "VeryLazy",
        keys = {
            { "<C-j>", [[<C-\><C-n><C-W>j]], mode = "t" },
            { "<C-k>", [[<C-\><C-n><C-W>k]], mode = "t" },
            { "<esc><esc>", [[<C-\><C-n>]], mode = "t" },
        },
        config = function()
            local toggleterm = require("toggleterm")

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
                shell = vim.o.shell,
            })
        end,
    },
    {
        "SmiteshP/nvim-navic",
        commit = "0ffa7ffe6588f3417e680439872f5049e38a24db",
        event = "VeryLazy",
        opts = {
            highlight = true,
        },
    },
    {
        "nvim-lualine/lualine.nvim",
        tag = "compat-nvim-0.6",
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
                    return "spc: " .. width
                else
                    return "tab: " .. width
                end
            end

            local function winbarCond()
                if not require("nvim-navic").is_available() then
                    return false
                end

                return true
            end

            require("lualine").setup({
                options = {
                    section_separators = "",
                    component_separators = "",
                    icons_enabled = false,
                },
                sections = {
                    lualine_c = {
                        { mixedIndent, color = "red" },
                        { "buffers", mode = 4 },
                    },
                    lualine_x = {
                        showIndent,
                        "fileformat",
                        "filetype",
                    },
                },
                tabline = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = {},
                    lualine_x = {},
                    lualine_y = {},
                    lualine_z = { { "tabs", mode = 2 } },
                },
                winbar = {
                    lualine_b = {
                        {
                            "filename",
                            path = 1,
                            cond = winbarCond,
                            shorting_target = 60,
                            color = { bg = "None", fg = "text", gui = "bold" },
                        },
                    },
                    lualine_c = {
                        {
                            "navic",
                            color_correction = nil,
                            navic_opts = nil,
                            color = { bg = "None", fg = "text" },
                        },
                    },
                },
                inactive_winbar = {
                    lualine_b = {
                        {
                            "filename",
                            path = 1,
                            cond = winbarCond,
                            shorting_target = 60,
                            color = { bg = "None", fg = "text", gui = "bold" },
                        },
                    },
                    lualine_c = {
                        {
                            "navic",
                            color_correction = nil,
                            navic_opts = nil,
                            color = { bg = "None", fg = "text" },
                        },
                    },
                },
                extensions = {
                    "quickfix",
                    "toggleterm",
                    "man",
                    "fugitive",
                    "lazy",
                    "trouble",
                    "mason",
                    "nvim-dap-ui",
                },
            })
        end,
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
            text = {
                spinner = "dots_pulse",
                done = "✔",
            },
        },
    },
    {
        "RRethy/vim-illuminate",
        commit = "3bd2ab64b5d63b29e05691e624927e5ebbf0fb86",
        event = "LspAttach",
        config = function()
            require("illuminate").configure({
                providers = {
                    "lsp",
                },
            })
        end,
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
        },
    },
    {
        "prichrd/netrw.nvim",
        commit = "596435bd2f5b0162b86c97ca8244e2b0862d3a4a",
        config = true,
        event = "VeryLazy",
    },
}
