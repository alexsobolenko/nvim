return {
    -- onedark colorscheme
    -- {
    --     "navarasu/onedark.nvim",
    --     config = function()
    --         require("onedark").setup({
    --             style = "warmer",
    --         })
    --         vim.cmd([[colorscheme onedark]])
    --     end,
    -- },

    -- monokai colorscheme
    {
        "tanvirtin/monokai.nvim",
        config = function()
            require("monokai").setup({
                palette = require("monokai").ristretto,
                italics = false,
            })
            vim.cmd([[colorscheme monokai]])
        end,
    }
}
