-- Onedark
return {
    "navarasu/onedark.nvim",
    config = function()
        require("onedark").setup({
            style = "warmer",
        })
        vim.cmd([[colorscheme onedark]])
    end,
}

-- Monokai
-- return {
--     "tanvirtin/monokai.nvim",
--     config = function()
--         require("monokai").setup {
--             palette = require("monokai").pro,
--         }
--         vim.cmd([[colorscheme monokai]])
--     end,
-- }
