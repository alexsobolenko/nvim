return {
    "akinsho/bufferline.nvim",
    dependencies = {
        { "nvim-tree/nvim-web-devicons" },
    },
    config = function()
        require("bufferline").setup({
            options = {
                close_command = "bdelete! %d",
                right_mouse_command = "bdelete! %d",
                left_mouse_command = "buffer %d",
                buffer_close_icon = "",
                numbers = "ordinal",
                show_close_icons = true,
                offsets = {
                    { rhs = 1, min = 0, max = 12 },
                    {
                        filetype = "neo-tree",
                        text = "File Explorer",
                        separator = true,
                        padding = 0,
                    },
                },
                mode = "buffers",
                diagnostics = "nvim_lsp",
                indicator = {
                    icon = "  ",
                    style = "icon",
                },
                shape = "rounded",
                padding = {
                    left = 0,
                    right = 1,
                    top = 0,
                    bottom = 0,
                },
                border = {
                    "rounded",
                    { l = " ", r = " " },
                },
                virtual_text = true,
                custom_arround_filetypes = {
                    cpp = { "clangd" },
                    lua = { "null-ls" },
                },
                highlight_group = {
                    normal = "BufferLine",
                    buffer_selected = "BufferLine_BufferSelected",
                    buffer_visible = "BufferLine_BufferVisible",
                    buffer_close = "BufferLine_BufferClose",
                    buffer_directory = "Directory",
                    buffer_modified = "Modified",
                    buffer_not_saved = "NonSaved",
                    buffer_insert = "Insert",
                    buffer_visual = "Visual",
                    buffer_leaf = "Leaf",
                    buffer_expand = "Expandable",
                    buffer_collapse = "Collapsible",
                    indicator_selected = "BufferLine_IndicatorSelected",
                    indicator_normal = "BufferLine_IndicatorNormal",
                },
            },
        })

        local k = vim.keymap
        local opts = { noremap = true, silent = true }

        opts.desc = "Next buffer"
        k.set("n", "<Tab>", ":BufferLineCycleNext<CR>", opts)

        opts.desc = "Previous buffer"
        k.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", opts)

        opts.desc = "Close buffer"
        k.set("n", "<leader>bc", ":bdelete<CR>", opts)

        for i = 1, 9 do
            opts.desc = "Go to buffer " .. i
            k.set("n", "<leader>" .. i, ":BufferLineGoToBuffer " .. i .. "<CR>", opts)
        end
    end,
}
