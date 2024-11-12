return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        { "nvim-lua/plenary.nvim" },
    },
    keys = function()
        local builtin = require("telescope.builtin")
        local opts = { noremap = true, silent = true }

        return {
            {
                "<leader>ff",
                builtin.find_files,
                mode = "n",
                desc = "Find files",
            },
            {
                "<leader>fw",
                builtin.live_grep,
                mode = "n",
                desc = "Find words",
            },
            {
                "<leader>fb",
                builtin.buffers,
                mode = "n",
                desc = "Find buffers",
            },
            {
                "<leader>fh",
                builtin.help_tags,
                mode = "n",
                desc = "Find help",
            },
            {
                "<leader>gb",
                builtin.git_branches,
                mode = "n",
                desc = "Git branches",
            },
            {
                "<leader>gc",
                builtin.git_commits,
                mode = "n",
                desc = "Git commits",
            },
            {
                "<leader>gs",
                builtin.git_status,
                mode = "n",
                desc = "Git status",
            },
            {
                "<leader>ls",
                builtin.lsp_document_symbols,
                mode = "n",
                desc = "LSP document symbols",
            },
            {
                "gr",
                builtin.lsp_references,
                mode = "n",
                desc = "Go to references",
                opts,
            },
            {
                "gd",
                builtin.lsp_definitions,
                mode = "n",
                desc = "Go to definition",
                opts,
            },
        }
    end,
    config = function()
        require("telescope").setup({
            defaults = {
                prompt_prefix = "> ",
                selection_caret = "> ",
                entry_prefix = "  ",
                initial_mode = "insert",
                layout_strategy = "horizontal",
                layout_config = {
                    prompt_position = "top",
                    width = 0.75,
                    height = 0.75,
                },
            },
        })
    end,
}
