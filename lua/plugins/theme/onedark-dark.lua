-- onedark (dark) colorscheme neovim

return {
    "navarasu/onedark.nvim",
    config = function()
        if vim.g.nvim_theme == "onedark-dark" then
            local o = require("onedark")
            o.setup({ style = "dark" })
            o.load()
        end
    end,
}
