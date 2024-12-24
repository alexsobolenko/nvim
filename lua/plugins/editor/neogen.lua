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

        opts.desc = "Generate annotation"
        k.set("n", "<leader>an", ":lua require('neogen').generate<CR>", opts)

        opts.desc = "Annotate function"
        k.set("n", "<leader>af", ":lua require('neogen').generate({ type = 'func' })<CR>", opts)

        opts.desc = "Annotate class"
        k.set("n", "<leader>ac", ":lua require('neogen').generate({ type = 'class' })<CR>", opts)

        opts.desc = "Annotate type"
        k.set("n", "<leader>at", ":lua require('neogen').generate({ type = 'type' })<CR>", opts)

        opts.desc = "Annotate file"
        k.set("n", "<leader>aa", ":lua require('neogen').generate({ type = 'file' })<CR>", opts)
    end,
}
