-- onedark (darker) colorscheme neovim

return {
    "navarasu/onedark.nvim",
    config = function()
        if vim.g.nvim_theme == "onedark-darker" then
            local o = require("onedark")
            o.setup({ style = "darker" })
            o.load()
        end
    end,
}
