return {
    "tanvirtin/monokai.nvim",
    config = function()
        require("monokai").setup({
            palette = require("monokai").ristretto,
            italics = false,
        })
        vim.cmd([[colorscheme monokai]])
    end,
}
