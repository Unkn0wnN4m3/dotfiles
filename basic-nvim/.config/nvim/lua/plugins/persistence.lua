return {
    {
        "folke/persistence.nvim",
        event = "BufReadPre",
        config = true,
        keys = {
            { "<leader>qs", "<cmd>lua require('persistence').load()<cr>",                desc = "Restore Session" },
            { "<leader>ql", "<cmd>lua require('persistence').load({ last = true })<cr>", desc = "Restore Last Session" },
            { "<leader>qd", "<cmd>lua require('persistence').stop()<cr>",                desc = "Don't Save Current Session" },
        }
    }
}
