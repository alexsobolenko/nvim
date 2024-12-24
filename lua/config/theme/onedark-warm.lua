-- onedark (warm) colorscheme neovim

return {
    "navarasu/onedark.nvim",
    config = function()
        local o = require("onedark")
        o.setup({ style = "warm" })
        o.load()
    end,
}
