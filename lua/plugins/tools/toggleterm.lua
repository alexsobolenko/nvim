return {
    "akinsho/toggleterm.nvim",
    version = "*",
    keys = {
        {
            "<leader>tf",
            ":ToggleTerm direction=float<CR>",
            mode = "n",
            desc = "Show Terminal float",
        },
        {
            "<leader>th",
            ":ToggleTerm direction=horizontal<CR>",
            mode = "n",
            desc = "Show Terminal horizontal",
        },
        {
            "<leader>tv",
            ":ToggleTerm direction=vertical size=40<CR>",
            mode = "n",
            desc = "Show Terminal vertical",
        },
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
}
