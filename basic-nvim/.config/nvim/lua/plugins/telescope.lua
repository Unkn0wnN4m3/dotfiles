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
                require("telescope.builtin").find_files,
                desc = "Find files",
            },
            {
                "<leader>fG",
                require("telescope.builtin").git_files,
                desc = "Git files",
            },
            {
                "<leader>fg",
                require("telescope.builtin").live_grep,
                desc = "Live grep",
            },
            { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
            {
                "<leader>fh",
                require("telescope.builtin").help_tags,
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
                require("telescope.builtin").oldfiles,
                desc = "Old files (all)",
            },
            {
                "<leader>fd",
                require("telescope.builtin").diagnostics,
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
                require("telescope.builtin").lsp_references,
                desc = "LSP references",
            },
            {
                "<leader>fS",
                require("telescope.builtin").lsp_document_symbols,
                desc = "LSP document symbols",
            },
            {
                "<leader>fW",
                require("telescope.builtin").lsp_dynamic_workspace_symbols,
                desc = "LSP workspace symbols",
            },
            {
                "<leader>fI",
                require("telescope.builtin").lsp_implementations,
                desc = "LSP implementations",
            },
            {
                "<leader>fk",
                require("telescope.builtin").keymaps,
                desc = "Keymaps",
            },
        },
    },
}
