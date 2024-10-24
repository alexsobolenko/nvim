return {
    "tanvirtin/monokai.nvim",
    config = function()
        require("monokai").setup {
            palette = require("monokai").pro,
        }
        vim.cmd([[colorscheme monokai]])
    end
}

