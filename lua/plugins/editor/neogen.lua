return {
    "danymat/neogen",
    dependencies = {
        { "nvim-treesitter/nvim-treesitter" },
    },
    keys = {
        {
            "<Leader>gd",
            ":lua require('neogen').generate({ type = 'func' })<CR>",
            mode = "n",
            desc = "Generate docblock",
            { noremap = true, silent = true },
        },
    },
    config = function()
        require("neogen").setup({
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
    end,
}
