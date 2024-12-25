-- onedark (deep) colorscheme neovim

return {
    "navarasu/onedark.nvim",
    config = function()
        if vim.g.nvim_theme == "onedark-deep" then
            local o = require("onedark")
            o.setup({ style = "deep" })
            o.load()
        end
    end,
}
