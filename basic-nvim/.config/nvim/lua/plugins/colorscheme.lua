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
            })
            vim.cmd.colorscheme "catppuccin-nvim"
        end
    }
}
