-- onedark (warmer) colorscheme neovim

return {
    "navarasu/onedark.nvim",
    config = function()
        local o = require("onedark")
        o.setup({ style = "warmer" })
        o.load()
    end,
}
