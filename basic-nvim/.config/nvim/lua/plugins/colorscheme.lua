return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        opts = {
            background = {
                light = "latte",
                dark = "macchiato",
            },
            dim_inactive = {
                enabled = true,
                shade = "dark",
                percentage = 0.10,
            },
            auto_integrations = true,
        },
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            style = "storm",
            light_style = "day",
        },
    },
    {
        "rose-pine/neovim",
        lazy = false,
        priority = 1000,
        name = "rose-pine",
        opts = {
            dark_variant = "moon",
        },
    },
    {
        "craftzdog/solarized-osaka.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },
}
