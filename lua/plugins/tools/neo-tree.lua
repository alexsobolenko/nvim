-- navigation tree

return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    event = { "VimEnter" },
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-tree/nvim-web-devicons" },
        { "MunifTanjim/nui.nvim" },
    },
    config = function()
        require("neo-tree").setup({
            close_if_last_window = true,
            popup_border_style = "rounded",
            enable_git_status = true,
            enable_diagnostics = true,
            filesystem = {
                follow_current_file = {
                    enabled = true,
                },
                use_libuv_file_watcher = true,
                filtered_items = {
                    visible = true,
                    hide_dotfiles = false,
                    hide_gitignored = false,
                    hide_by_name = { ".git", ".idea", ".vscode" },
                },
            },
        })

        -- mappings
        local k = vim.keymap
        local opts = { noremap = true, silent = true }

        opts.desc = "Neotree float"
        k.set("n", "<leader>e", ":Neotree float<CR>", opts)

        opts.desc = "Neotree left panel"
        k.set("n", "<leader>E", ":Neotree left panel<CR>", opts)
    end,
}
