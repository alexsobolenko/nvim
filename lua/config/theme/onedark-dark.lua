-- onedark (dark) colorscheme neovim

return {
    "navarasu/onedark.nvim",
    config = function()
        local o = require("onedark")
        o.setup({ style = "dark" })
        o.load()
    end,
}
