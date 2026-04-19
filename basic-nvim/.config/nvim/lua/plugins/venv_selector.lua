return {
    {
        "linux-cultist/venv-selector.nvim",
        dependencies = {
            {
                "nvim-telescope/telescope.nvim",
                "nvim-lua/plenary.nvim",
            },
        },
        ft = "python",
        keys = {
            {
                "<leader>cv",
                "<cmd>:VenvSelect<cr>",
                desc = "Select VirtualEnv",
                ft = "python",
            },
        },
        opts = {
            options = {
                notify_user_on_venv_activation = true,
                override_notify = false,
            },
        },
    },
}
