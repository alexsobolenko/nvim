-- onedark (cool) colorscheme neovim

return {
    "navarasu/onedark.nvim",
    config = function()
        local o = require("onedark")
        o.setup({ style = "cool" })
        o.load()
    end,
}
