-- onedark (warmer) colorscheme neovim

return {
    "navarasu/onedark.nvim",
    config = function()
        if vim.g.nvim_theme == "onedark-warmer" then
            local o = require("onedark")
            o.setup({ style = "warmer" })
            o.load()
        end
    end,
}
