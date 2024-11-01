return {
    -- neotree
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-tree/nvim-web-devicons" },
            { "MunifTanjim/nui.nvim" },
        },
        config = function()
            require('neo-tree').setup({
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
    },

    -- telescope
    -- TODO: replace keys to mappings config
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = {
            { "nvim-lua/plenary.nvim" },
        },
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

            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
            vim.keymap.set("n", "<leader>fw", builtin.live_grep, {})
            vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
            vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
            vim.keymap.set("n", "<leader>gb", builtin.git_branches, {})
            vim.keymap.set("n", "<leader>gc", builtin.git_commits, {})
            vim.keymap.set("n", "<leader>gs", builtin.git_status, {})
            vim.keymap.set("n", "<leader>ls", builtin.lsp_document_symbols, {})
            vim.keymap.set("n", "gr", builtin.lsp_references, {noremap = true, silent = true})
            vim.keymap.set("n", "gd", builtin.lsp_definitions, {noremap = true, silent = true})
        end,
    },

    -- toggleterm
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = function()
            require("toggleterm").setup({
                open_mapping = [[<c-\>]],
                shading_factor = 2,
                start_in_insert = true,
                close_on_exit = true,
                shell = vim.o.shell,
                float_opts = {
                    border = "curved",
                    winblend = 3,
                },
            })

            function _G.set_terminal_keymaps()
                local opts = {buffer = 0}
                vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
                vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
                vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
                vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
                vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
                vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
                vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
            end

            vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
        end,
    },
}
