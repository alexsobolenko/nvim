-- onedark (deep) colorscheme neovim

return {
    "navarasu/onedark.nvim",
    config = function()
        local o = require("onedark")
        o.setup({ style = "deep" })
        o.load()
    end,
}
