return {
    {
        "nvim-mini/mini.icons",
        version = "*",
        config = true
    },
    {
        "nvim-mini/mini.basics",
        version = "*",
        opts = {
            options = {
                basic = true,
                extra_ui = true,
            },
            mappings = {
                basic = true,
            },
            autocommands = {
                basic = true,
                relnum_in_visual_mode = true,
            }
        }
    },
    {
        "nvim-mini/mini.cmdline",
        version = "*",
        config = true,
    },
    {
        "nvim-mini/mini.statusline",
        version = "*",
        config = true,
        dependencies = {
            { "nvim-mini/mini-git",  version = "*" },
            { "nvim-mini/mini.diff", version = "*" }
        }
    },
    {
        "nvim-mini/mini.tabline",
        version = "*",
        config = true,
    },
    {
        "nvim-mini/mini.notify",
        version = "*",
        event = "VimEnter",
        keys = {
            { "<leader>un", "<cmd>lua MiniNotify.show_history()<cr>", desc = "Mini Notify show notifications history" },
            { "<leader>ur", "<cmd>lua MiniNotify.remove()<cr>",       desc = "Mini Notify remove notifications" },
        },
        opts = {
            lsp_progress = {
                enable = true,
                level = 'INFO',
                duration_last = 1000,
            },
        }
    },
    {
        "nvim-mini/mini.completion",
        event = "InsertEnter",
        config = true,
    },
    {
        "nvim-mini/mini.snippets",
        version = "*",
        event = "InsertEnter",
        config = true,
    },
    {
        "nvim-mini/mini.pairs",
        event = "InsertEnter",
        opts = {
            modes = { insert = true, command = true, terminal = false },
        }
    },
    {
        "nvim-mini/mini.cursorword",
        version = "*",
        event = "VeryLazy",
        config = true,
    },
    {
        "nvim-mini/mini.indentscope",
        version = "*",
        event = "VeryLazy",
        config = true
    },
    {
        "nvim-mini/mini.trailspace",
        version = "*",
        event = "VeryLazy",
        config = true,
    },
    {
        "nvim-mini/mini.bufremove",
        version = "*",
        event = "VeryLazy",
        config = true,
    },
    {
        "nvim-mini/mini.jump",
        version = "*",
        event = "VeryLazy",
        config = true,
    },
    {
        "nvim-mini/mini.pick",
        version = "*",
        dependencies = {
            {
                "nvim-mini/mini.extra",
                version = "*",
                config = true,
            }
        },
        keys = {
            { "<leader>ff", "<cmd>Pick files<cr>",                      desc = "Mini Pick files" },
            { "<leader>fg", "<cmd>Pick files tool='git'<cr>",           desc = "Mini Pick git files" },
            { "<leader>fG", "<cmd>Pick grep_live<cr>",                  desc = "Mini Pick live grep" },
            { "<leader>fh", "<cmd>Pick help<cr>",                       desc = "Mini Pick help tags" },
            { "<leader>fb", "<cmd>Pick buffers<cr>",                    desc = "Mini Pick buffers" },
            { "<leader>fd", "<cmd>Pick diagnostic scope='current'<cr>", desc = "Mini Pick buffer diagnostics" },
            { "<leader>fD", "<cmd>Pick diagnostic scope='all'<cr>",     desc = "Mini Pick all diagnostics" },
            { "<leader>fk", "<cmd>Pick keymaps<cr>",                    desc = "Mini Pick keymaps" },
        },
        opts = {
            window = {
                config = function()
                    local height = math.floor(0.618 * vim.o.lines)
                    local width = math.floor(0.618 * vim.o.columns)
                    return {
                        anchor = 'NW',
                        height = height,
                        width = width,
                        row = math.floor(0.5 * (vim.o.lines - height)),
                        col = math.floor(0.5 * (vim.o.columns - width)),
                    }
                end
            }
        }
    },
    {
        "nvim-mini/mini.clue",
        event = "VeryLazy",
        config = function()
            local miniclue = require('mini.clue')
            miniclue.setup({
                triggers = {
                    -- Leader triggers
                    { mode = { 'n', 'x' }, keys = '<Leader>' },

                    -- `[` and `]` keys
                    { mode = 'n',          keys = '[' },
                    { mode = 'n',          keys = ']' },

                    -- Built-in completion
                    { mode = 'i',          keys = '<C-x>' },

                    -- `g` key
                    { mode = { 'n', 'x' }, keys = 'g' },

                    -- Marks
                    { mode = { 'n', 'x' }, keys = "'" },
                    { mode = { 'n', 'x' }, keys = '`' },

                    -- Registers
                    { mode = { 'n', 'x' }, keys = '"' },
                    { mode = { 'i', 'c' }, keys = '<C-r>' },

                    -- Window commands
                    { mode = 'n',          keys = '<C-w>' },

                    -- `z` key
                    { mode = { 'n', 'x' }, keys = 'z' },
                },

                clues = {
                    -- Enhance this by adding descriptions for <Leader> mapping groups
                    miniclue.gen_clues.square_brackets(),
                    miniclue.gen_clues.builtin_completion(),
                    miniclue.gen_clues.g(),
                    miniclue.gen_clues.marks(),
                    miniclue.gen_clues.registers(),
                    miniclue.gen_clues.windows(),
                    miniclue.gen_clues.z(),
                },
                window = {
                    config = {
                        width = 'auto',
                    },
                    delay = 300,
                    scroll_down = '<C-d>',
                    scroll_up = '<C-u>',
                },
            })
        end
    },
}
