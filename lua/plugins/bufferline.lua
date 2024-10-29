return {
    "akinsho/bufferline.nvim",
    dependencies = {
        { "nvim-tree/nvim-web-devicons" },
    },
    config = function()
        require("bufferline").setup({
            options = {
                numbers = "ordinal",
                close_command = "bdelete! %d",
                right_mouse_command = "bdelete! %d",
                left_mouse_command = "buffer %d",
                buffer_close_icon = "",
                modified_icon = "●",
                mode = "buffers",
                offsets = {
                    {
                        filetype = "neo-tree",
                        text = "File Explorer",
                        separator = true,
                        padding = 1,
                    },
                },
                diagnostics = "nvim_lsp",
                indicator = {
                    icon = "  ",
                    style = "icon",
                },
                separator_style = "slope",
            },
        })
    end,
}
