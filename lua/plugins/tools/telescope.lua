-- grep git, filesystem, code

return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        { "nvim-lua/plenary.nvim" },
    },
    config = function()
        local icons = require("extras.icons")
        require("telescope").setup({
            defaults = {
                prompt_prefix = icons.telescope.prompt_prefix,
                selection_caret = icons.telescope.selection_caret,
                entry_prefix = icons.telescope.entry_prefix,
                initial_mode = "insert",
                layout_strategy = "horizontal",
                layout_config = {
                    prompt_position = "top",
                    width = 0.75,
                    height = 0.75,
                },
            },
        })

        -- mappings
        local builtin = require("telescope.builtin")
        local k = vim.keymap
        local opts = { noremap = true, silent = true }

        opts.desc = "Find files"
        k.set("n", "<leader>ff", builtin.find_files, opts)

        opts.desc = "Find words"
        k.set("n", "<leader>fw", builtin.live_grep, opts)

        opts.desc = "Find buffers"
        k.set("n", "<leader>fb", builtin.buffers, opts)

        opts.desc = "Find help"
        k.set("n", "<leader>fh", builtin.help_tags, opts)

        opts.desc = "Git branches"
        k.set("n", "<leader>gb", builtin.git_branches, opts)

        opts.desc = "Git commits"
        k.set("n", "<leader>gc", builtin.git_commits, opts)

        opts.desc = "Git status"
        k.set("n", "<leader>gs", builtin.git_status, opts)

        opts.desc = "LSP document symbols"
        k.set("n", "<leader>ls", builtin.lsp_document_symbols, opts)

        opts.desc = "Go to references"
        k.set("n", "gr", builtin.lsp_references, opts)

        opts.desc = "Go to definition"
        k.set("n", "gd", builtin.lsp_definitions, opts)
    end,
}
