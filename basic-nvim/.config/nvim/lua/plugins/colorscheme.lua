return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = true,
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
        lazy = true,
        opts = {
            style = "storm",
            light_style = "day",
        },
    },
    {
        "rose-pine/neovim",
        lazy = true,
        name = "rose-pine",
        opts = {
            dark_variant = "moon",
        },
    },
    {
        "craftzdog/solarized-osaka.nvim",
        lazy = true,
        opts = {
            transparent = true,
        },
    },
    {
        "neanias/everforest-nvim",
        name = "everforest",
        version = false,
        lazy = true,
        opts = {},
    },
}
