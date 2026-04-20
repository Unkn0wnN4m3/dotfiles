return {
    {
        "nvim-telescope/telescope.nvim",
        version = "*",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        opts = {
            defaults = {
                layout_strategy = "horizontal",
                sorting_strategy = "ascending",
                layout_config = {
                    horizontal = {
                        prompt_position = "top",
                        preview_width = 0.55,
                        results_width = 0.8,
                    },
                    vertical = {
                        mirror = false,
                    },
                },
            },
        },
        keys = {
            {
                "<leader>ff",
                function()
                    require("telescope.builtin").find_files()
                end,
                desc = "Find files",
            },
            {
                "<leader>fG",
                function()
                    require("telescope.builtin").git_files()
                end,
                desc = "Git files",
            },
            {
                "<leader>fg",
                function()
                    require("telescope.builtin").live_grep()
                end,
                desc = "Live grep",
            },
            {
                "<leader>fb",
                function()
                    require("telescope.builtin").buffers()
                end,
                desc = "Buffers",
            },
            {
                "<leader>fh",
                function()
                    require("telescope.builtin").help_tags()
                end,
                desc = "Help tags",
            },
            {
                "<leader>fo",
                function()
                    require("telescope.builtin").oldfiles({
                        only_cwd = true,
                    })
                end,
                desc = "Old files (cwd)",
            },
            {
                "<leader>fO",
                function()
                    require("telescope.builtin").oldfiles()
                end,
                desc = "Old files (all)",
            },
            {
                "<leader>fd",
                function()
                    require("telescope.builtin").diagnostics()
                end,
                desc = "Diagnostics (buffer)",
            },
            {
                "<leader>fD",
                function()
                    require("telescope.builtin").diagnostics({
                        bufnr = nil,
                    })
                end,
                desc = "Diagnostics (workspace)",
            },
            {
                "<leader>fR",
                function()
                    require("telescope.builtin").lsp_references()
                end,
                desc = "LSP references",
            },
            {
                "<leader>fS",
                function()
                    require("telescope.builtin").lsp_document_symbols()
                end,
                desc = "LSP document symbols",
            },
            {
                "<leader>fW",
                function()
                    require("telescope.builtin").lsp_dynamic_workspace_symbols()
                end,
                desc = "LSP workspace symbols",
            },
            {
                "<leader>fI",
                function()
                    require("telescope.builtin").lsp_implementations()
                end,
                desc = "LSP implementations",
            },
            {
                "<leader>fk",
                function()
                    require("telescope.builtin").keymaps()
                end,
                desc = "Keymaps",
            },
        },
    },
}
