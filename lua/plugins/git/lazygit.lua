return {
    "kdheepak/lazygit.nvim",
    cmd = { "LazyGit", "LazyGitConfig", "LazyGitCurrentFile", "LazyGitFilter", "LazyGitFilterCurrentFile" },
    dependencies = {
        { "nvim-telescope/telescope.nvim" },
        { "nvim-lua/plenary.nvim" },
    },
    keys = {
        { "<leader>lg", ":LazyGit<CR>", mode = "n", desc = "LazyGit" },
        { "<leader>lc", ":LazyGitFilterCurrentFile<CR>", mode = "n", desc = "LazyGit filter current" },
    },
    config = function()
        require("telescope").load_extension("lazygit")
    end,
}
