local k = vim.keymap
vim.g.mapleader = " "

k.set("n", "<c-k>", ":wincmd k<CR>", { desc = "Move up" })
k.set("n", "<c-j>", ":wincmd j<CR>", { desc = "Move down" })
k.set("n", "<c-h>", ":wincmd h<CR>", { desc = "Move left" })
k.set("n", "<c-l>", ":wincmd l<CR>", { desc = "Move right" })
k.set("n", "|", ":vsplit<CR>", { desc = "Split vertical" })
k.set("n", "\\", ":split<CR>", { desc = "Split horizontal" })
k.set("n", "<leader>w", ":w<CR>", { desc = "Save buffer" })
k.set("i", "jj", "<Esc>", { desc = "Escape" })
k.set("n", "<leader>h", ":nohlsearch<CR>", { desc = "Reset search highlights" })
k.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
k.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })
