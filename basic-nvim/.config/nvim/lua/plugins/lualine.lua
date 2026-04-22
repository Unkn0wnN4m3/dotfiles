return {
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        -- dependencies = {
        --     "nvim-mini/mini.icons",
        -- },
        opts = function()
            -- global statusline
            vim.opt.laststatus = 3

            return {
                options = {
                    component_separators = {},
                    section_separators = {},
                    disabled_filetypes = {
                        statusline = {
                            "ministarter",
                        },
                        winbar = {
                            "ministarter",
                            "checkhealth",
                            "help",
                            "lazy",
                            "mason",
                            "",
                        },
                    },
                },
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = { "branch", "diff", "diagnostics" },
                    lualine_c = { "lsp_status" },
                    lualine_x = {
                        "encoding",
                        "fileformat",
                        "filetype",
                    },
                    lualine_y = { "progress" },
                    lualine_z = { "location" },
                },
                -- winbar = {
                --     lualine_x = { { "filename", file_status = false } },
                -- },
                -- inactive_winbar = {
                --     lualine_x = { { "filename", file_status = false } },
                -- },
                extensions = { "lazy", "man", "quickfix" },
            }
        end,
    },
}
