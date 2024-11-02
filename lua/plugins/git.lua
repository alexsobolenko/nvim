return {
    -- gitsigns
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup({
                signs = {
                    add = { text = "┃" },
                    change = { text = "┃" },
                    delete = { text = "" },
                    topdelete = { text = "" },
                    changedelete = { text = "~" },
                    untracked = { text = "┆" },
                },
                signs_staged = {
                    add = { text = "┃" },
                    change = { text = "┃" },
                    delete = { text = "" },
                    topdelete = { text = "" },
                    changedelete = { text = "~" },
                    untracked = { text = "┆" },
                },
                current_line_blame = true,
            })
        end,
    },

    -- lazygit
    {
        "kdheepak/lazygit.nvim",
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        dependencies = {
            { "nvim-lua/plenary.nvim" },
        },
        keys = {
            { "<leader>lg", ":LazyGit<CR>", mode = "n", desc = "LazyGit" },
            { "<leader>lc", ":LazyGitFilterCurrentFile<CR>", mode = "n", desc = "LazyGit filter current" },
        },
    },
}
