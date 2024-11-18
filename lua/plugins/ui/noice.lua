-- command line

return {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
        { "MunifTanjim/nui.nvim" },
        { "rcarriga/nvim-notify" },
    },
    config = function()
        require("noice").setup({
            cmdline = {
                enabled = true,
                view = "cmdline_popup",
            },
            presets = {
                bottom_search = true,
                command_palette = true,
            },
        })
    end,
}
