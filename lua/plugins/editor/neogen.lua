-- create annotations

return {
    "danymat/neogen",
    dependencies = {
        { "nvim-treesitter/nvim-treesitter" },
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

        -- mappings
        local k = vim.keymap
        local opts = { noremap = true, silent = true }

        opts.desc = "Generate docblock"
        k.set("n", "<leader>gf", ":lua require('neogen').generate({ type = 'func' })<CR>", opts)
    end,
}
