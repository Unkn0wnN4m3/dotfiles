return {
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            {
                "mfussenegger/nvim-dap",
                version = "0.6.*"
            },
            {
                "theHamsta/nvim-dap-virtual-text",
                commit = "57f1dbd0458dd84a286b27768c142e1567f3ce3b",
                config = true
            }
        },
        version = "v3.9.*",
        event = "LspAttach",
        config = true,
        keys = {
            { "<leader>dui", "<CMD>lua require('dapui').toggle()<CR>" },
            { "<leader>dtp", "<CMD>lua require('dap').toggle_breakpoint()<CR>" },
            { "<leader>dcn", "<CMD>lua require('dap').continue()<CR>" },
            { "<leader>dso", "<CMD>lua require('dap').step_over()<CR>" },
            { "<leader>dsi", "<CMD>lua require('dap').step_into()<CR>" },
            { "<leader>dsO", "<CMD>lua require('dap').step_into()<CR>" },
        }
    },
    {
        "mfussenegger/nvim-dap-python",
        commit = "37b4cba02e337a95cb62ad1609b3d1dccb2e5d42",
        ft = "python",
        config = function()
            require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
        end
    }
}
