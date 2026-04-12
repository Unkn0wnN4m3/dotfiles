return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
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
            })
            vim.cmd.colorscheme "catppuccin-nvim"
        end
    }
}
