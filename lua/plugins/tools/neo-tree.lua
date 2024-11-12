return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    event = { "VimEnter" },
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-tree/nvim-web-devicons" },
        { "MunifTanjim/nui.nvim" },
    },
    keys = {
        {
            "<leader>E",
            ":Neotree float reveal<CR>",
            mode = "n",
            desc = "Neotree float",
        },
        {
            "<leader>e",
            ":Neotree left reveal<CR>",
            mode = "n",
            desc = "Neotree left panel",
        },
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
                    hide_by_name = {
                        ".git",
                        ".idea",
                        ".vscode",
                    },
                },
            },
        })
    end,
}
