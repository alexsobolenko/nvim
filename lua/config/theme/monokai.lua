-- monokai colorscheme neovim

return {
    "tanvirtin/monokai.nvim",
    config = function()
        print("hello")

        require("monokai").setup()
    end,
}
