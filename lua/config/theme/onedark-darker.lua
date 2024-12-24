-- onedark (darker) colorscheme neovim

return {
    "navarasu/onedark.nvim",
    config = function()
        local o = require("onedark")
        o.setup({ style = "darker" })
        o.load()
    end,
}
