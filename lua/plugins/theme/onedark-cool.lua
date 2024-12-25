-- onedark (cool) colorscheme neovim

return {
    "navarasu/onedark.nvim",
    config = function()
        if vim.g.nvim_theme == "onedark-cool" then
            local o = require("onedark")
            o.setup({ style = "cool" })
            o.load()
        end
    end,
}
