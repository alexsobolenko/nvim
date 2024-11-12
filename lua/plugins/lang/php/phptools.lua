return {
    "pcyman/phptools.nvim",
    keys = {
        {
            "<leader>gg",
            ":PhpToolsGetSet<CR>",
            mode = "n",
            desc = "PHP generate getters and setters",
        },
    },
    config = function()
        require("phptools").setup({})
    end,
}
