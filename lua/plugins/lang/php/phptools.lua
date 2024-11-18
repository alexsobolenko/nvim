return {
    "pcyman/phptools.nvim",
    config = function()
        require("phptools").setup()

        -- mappings
        local k = vim.keymap
        local opts = { noremap = true, silent = true }

        opts.desc = "PHP generate getters and setters"
        k.set("n", "<leader>gg", ":PhpToolsGetSet<CR>", opts)
    end,
}
