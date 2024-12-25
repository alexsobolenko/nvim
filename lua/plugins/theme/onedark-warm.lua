-- onedark (warm) colorscheme neovim

return {
    "navarasu/onedark.nvim",
    config = function()
        if vim.g.nvim_theme == "onedark-warm" then
            local o = require("onedark")
            o.setup({ style = "warm" })
            o.load()
        end
    end,
}
