return {
    {
        "nvim-mini/mini.starter",
        dependencies = {
            "nvim-telescope/telescope.nvim",
        },
        event = "VimEnter",
        opts = function()
            local wellcome_msg = "Wellcome back "
            local logo = table.concat({
                "██  ██ ▄████▄ ██ ▄█▀ ██▄  ▄██ ▄█████ ██  ██ ███  ██",
                "██████ ██▄▄██ ████   ██ ▀▀ ██ ██     ██████ ██ ▀▄██",
                "██  ██ ██  ██ ██ ▀█▄ ██    ██ ▀█████ ██  ██ ██   ██",
                " ",
                vim.env.USERNAME and (wellcome_msg .. vim.env.USERNAME)
                    or vim.env.USER and (wellcome_msg .. vim.env.USER)
                    or "Welcome to Neovim!",
            }, "\n")

            local new_section = function(name, action, section)
                return { name = name, action = action, section = section }
            end

            local starter = require("mini.starter")
            local opts = {
                evaluate_single = true,
                header = logo,
                items = {
                    new_section(
                        "Find file",
                        "Telescope find_files",
                        "Telescope"
                    ),
                    new_section("New file", "ene | startinsert", "Built-in"),
                    new_section(
                        "Recent files",
                        "Telescope oldfiles only_cwd=true",
                        "Telescope"
                    ),
                    new_section(
                        "Find text",
                        "Telescope live_grep",
                        "Telescope"
                    ),
                    new_section(
                        "Restore session",
                        [[lua require("persistence").load()]],
                        "Session"
                    ),
                    new_section("Lazy", "Lazy", "Config"),
                    new_section("Quit", "qa", "Built-in"),
                },
                footer = "",
                content_hooks = {
                    starter.gen_hook.adding_bullet("░ ", false),
                    starter.gen_hook.aligning("center", "center"),
                },
            }
            return opts
        end,
    },
    {
        "nvim-mini/mini.basics",
        priority = 1000,
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
            },
        },
    },
    {
        "nvim-mini/mini.statusline",
        config = true,
        dependencies = {
            "nvim-mini/mini-git",
            "nvim-mini/mini.diff",
            "nvim-mini/mini.icons",
        },
    },
    {
        "nvim-mini/mini.notify",
        lazy = false,
        keys = {
            {
                "<leader>un",
                "<cmd>lua MiniNotify.show_history()<cr>",
                desc = "Mini Notify show notifications history",
            },
            {
                "<leader>ur",
                "<cmd>lua MiniNotify.remove()<cr>",
                desc = "Mini Notify remove notifications",
            },
        },
        opts = {
            lsp_progress = {
                enable = true,
                level = "INFO",
                duration_last = 1000,
            },
        },
    },
    {
        "nvim-mini/mini.pairs",
        event = { "InsertEnter", "CmdlineEnter" },
        opts = function()
            vim.api.nvim_create_autocmd("InsertEnter", {
                group = vim.api.nvim_create_augroup(
                    "MiniPairsTex",
                    { clear = true }
                ),
                pattern = "*.typ",
                callback = function()
                    MiniPairs.map_buf(
                        0,
                        "i",
                        "$",
                        { action = "closeopen", pair = "$$" }
                    )
                end,
            })
            return {
                modes = { insert = true, command = true, terminal = false },
            }
        end,
    },
    {
        "nvim-mini/mini.tabline",
        event = "BufReadPre",
        dependencies = {
            "nvim-mini/mini.icons",
        },
        config = true,
    },
    {
        "nvim-mini/mini.indentscope",
        event = "BufReadPre",
        config = true,
    },
    {
        "nvim-mini/mini.trailspace",
        event = "BufReadPre",
        config = true,
    },
    {
        "nvim-mini/mini.bufremove",
        event = "BufReadPre",
        config = true,
    },
    {
        "nvim-mini/mini.jump",
        event = "BufReadPre",
        config = true,
    },
    {
        "nvim-mini/mini.surround",
        event = "BufReadPre",
        config = true,
    },
    {
        "nvim-mini/mini.hipatterns",
        event = "BufReadPre",
        opts = function()
            local hipatterns = require("mini.hipatterns")

            return {
                highlighters = {
                    -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
                    fixme = {
                        pattern = "%f[%w]()FIXME()%f[%W]",
                        group = "MiniHipatternsFixme",
                    },
                    hack = {
                        pattern = "%f[%w]()HACK()%f[%W]",
                        group = "MiniHipatternsHack",
                    },
                    todo = {
                        pattern = "%f[%w]()TODO()%f[%W]",
                        group = "MiniHipatternsTodo",
                    },
                    note = {
                        pattern = "%f[%w]()NOTE()%f[%W]",
                        group = "MiniHipatternsNote",
                    },

                    hex_color = hipatterns.gen_highlighter.hex_color(),
                },
            }
        end,
        config = function(_, opts)
            local hipatterns = require("mini.hipatterns")
            hipatterns.setup(opts)

            vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
                group = vim.api.nvim_create_augroup(
                    "MiniHipatternsLargeFiles",
                    { clear = true }
                ),
                callback = function()
                    local max_size = 100 * 1024
                    local file_size = vim.fn.getfsize(vim.fn.expand("%:p"))
                    if file_size > max_size then
                        vim.b.minihipatterns_disable = true
                    end
                end,
            })
        end,
    },
    {
        "nvim-mini/mini.diff",
        lazy = true,
        config = true,
    },
    {
        "nvim-mini/mini-git",
        lazy = true,
        config = function()
            require("mini.git").setup()
        end,
    },
    {
        "nvim-mini/mini.extra",
        lazy = true,
        config = true,
    },
    {
        "nvim-mini/mini.icons",
        config = true,
        lazy = true,
    },
    {
        "nvim-mini/mini.clue",
        event = "VeryLazy",
        config = function()
            local miniclue = require("mini.clue")
            miniclue.setup({
                triggers = {
                    -- Leader triggers
                    { mode = { "n", "x" }, keys = "<Leader>" },

                    -- `[` and `]` keys
                    { mode = "n", keys = "[" },
                    { mode = "n", keys = "]" },

                    -- Built-in completion
                    { mode = "i", keys = "<C-x>" },

                    -- `g` key
                    { mode = { "n", "x" }, keys = "g" },

                    -- Marks
                    { mode = { "n", "x" }, keys = "'" },
                    { mode = { "n", "x" }, keys = "`" },

                    -- Registers
                    { mode = { "n", "x" }, keys = '"' },
                    { mode = { "i", "c" }, keys = "<C-r>" },

                    -- Window commands
                    { mode = "n", keys = "<C-w>" },

                    -- `z` key
                    { mode = { "n", "x" }, keys = "z" },

                    -- `s` key surrounding motions
                    { mode = { "n", "x" }, keys = "s" },
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
                        width = "auto",
                    },
                    delay = 300,
                    scroll_down = "<C-d>",
                    scroll_up = "<C-u>",
                },
            })
        end,
    },
}
