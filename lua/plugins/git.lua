return {
    -- gitsigns
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup({
                signs = {
                    add = { text = "▎" },
                    change = { text = "▎" },
                    delete = { text = "" },
                    topdelete = { text = "" },
                    changedelete = { text = "▎" },
                    untracked = { text = "▎" },
                },
                signs_staged = {
                    add = { text = "▎" },
                    change = { text = "▎" },
                    delete = { text = "" },
                    topdelete = { text = "" },
                    changedelete = { text = "▎" },
                },
                on_attach = function(bufnr)
                    local gs = package.loaded.gitsigns
                    local opts = {noremap = true, silent = true}
                    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>hs", "<cmd>Gitsigns stage_hunk<CR>", opts)
                    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>hr", "<cmd>Gitsigns reset_hunk<CR>", opts)
                    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>hS", "<cmd>Gitsigns stage_buffer<CR>", opts)
                    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>hu", "<cmd>Gitsigns undo_stage_hunk<CR>", opts)
                    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>hp", "<cmd>Gitsigns preview_hunk<CR>", opts)
                end,
            })
        end,
    },
}
