return {
    {
        "folke/lazydev.nvim",
        cond = function()
            local helpers = require("helpers")
            return helpers.is_lua_installed()
        end,
        ft = "lua",
        opts = {
            library = {
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },
}
