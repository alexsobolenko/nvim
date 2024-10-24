return {
    "folke/trouble.nvim",
    dependencies = {
        { "nvim-tree/nvim-web-devicons" },
    },
    config = function()
        require("trouble").setup({
            auto_open = false,
            auto_close = true,
            signs = {
                error = "",
                warning = "",
                hint = "",
                information = "",
            },
        })
    end,
}

