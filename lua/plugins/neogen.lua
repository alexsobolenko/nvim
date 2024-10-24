return {
    "danymat/neogen",
    dependencies = {
        { "nvim-treesitter/nvim-treesitter" },
    },
    config = function()
        require('neogen').setup({
            enabled = true,
            languages = {
                php = {
                    template = {
                        annotation_convention = "phpdoc",
                        types = true,
                    },
                },
            },
        })
        vim.api.nvim_set_keymap("n", "<Leader>g", ":lua require('neogen').generate({ type = 'func' })<CR>", { noremap = true, silent = true })
    end,
}

