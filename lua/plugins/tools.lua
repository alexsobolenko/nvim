return {
    -- neotree
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        event = { "VimEnter" },
        dependencies = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-tree/nvim-web-devicons" },
            { "MunifTanjim/nui.nvim" },
        },
        keys = {
            { "<leader>e", ":Neotree float reveal<CR>", mode = "n", desc = "Neotree float" },
            { "<leader>E", ":Neotree left reveal<CR>", mode = "n", desc = "Neotree left panel" },
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
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = {
            { "nvim-lua/plenary.nvim" },
        },
        keys = function()
            local builtin = require("telescope.builtin")

            return {
                { "<leader>ff", builtin.find_files, mode = "n", desc = "Find files" },
                { "<leader>fw", builtin.live_grep, mode = "n", desc = "Find words" },
                { "<leader>fb", builtin.buffers, mode = "n", desc = "Find buffers" },
                { "<leader>fh", builtin.help_tags, mode = "n", desc = "Find help" },
                { "<leader>gb", builtin.git_branches, mode = "n", desc = "Git branches" },
                { "<leader>gc", builtin.git_commits, mode = "n", desc = "Git commits" },
                { "<leader>gs", builtin.git_status, mode = "n", desc = "Git status" },
                { "<leader>ls", builtin.lsp_document_symbols, mode = "n", desc = "LSP document symbols" },
                { "gr", builtin.lsp_references, mode = "n", desc = "Go to references", { noremap = true, silent = true } },
                { "gd", builtin.lsp_definitions, mode = "n", desc = "Go to definition", { noremap = true, silent = true } },
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
    },

    -- toggleterm
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        keys = {
            { "<leader>tf", ":ToggleTerm direction=float<CR>", mode = "n", desc = "Show Terminal float" },
            { "<leader>th", ":ToggleTerm direction=horizontal<CR>", mode = "n", desc = "Show Terminal horizontal" },
            { "<leader>tv", ":ToggleTerm direction=vertical size=40<CR>", mode = "n", desc = "Show Terminal vertical" },
        },
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
                vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], { buffer = 0 })
                vim.keymap.set("t", "jk", [[<C-\><C-n>]], { buffer = 0 })
                vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], { buffer = 0 })
                vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], { buffer = 0 })
                vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], { buffer = 0 })
                vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], { buffer = 0 })
                vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], { buffer = 0 })
            end

            vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
        end,
    },
}
