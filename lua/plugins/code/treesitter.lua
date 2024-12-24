-- syntax highlights

return {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
        local t = require("extras.treesitter")
        require("nvim-treesitter.configs").setup({
            ensure_installed = t.ensure_installed,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            indent = {
                enable = true,
            },
            sync_install = false,
            auto_install = true,
            ignore_install = {},
            modules = {},
        })
    end,
}
