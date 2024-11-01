vim.g.mapleader = " "

vim.keymap.set("n", "<c-k>", ":wincmd k<CR>", { desc = "Move up" })
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>", { desc = "Move down" })
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>", { desc = "Move left" })
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>", { desc = "Move right" })
vim.keymap.set("n", "|", ":vsplit<CR>", { desc = "Split vertical" })
vim.keymap.set("n", "\\", ":split<CR>", { desc = "Split horizontal" })
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save buffer" })
vim.keymap.set("i", "jj", "<Esc>", { desc = "Escape" })
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>", { desc = "Reset search highlights" })
