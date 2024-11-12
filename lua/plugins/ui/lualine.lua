return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        { "nvim-tree/nvim-web-devicons" },
    },
    config = function()
        local monokai_theme = {
            normal = {
                a = { fg = "#272822", bg = "#f92672", gui = "bold" },
                b = { fg = "#f8f8f2", bg = "#49483e" },
                c = { fg = "#f8f8f2", bg = "#272822" },
            },
            insert = { a = { fg = "#272822", bg = "#a6e22e", gui = "bold" } },
            visual = { a = { fg = "#272822", bg = "#66d9ef", gui = "bold" } },
            replace = { a = { fg = "#272822", bg = "#fd971f", gui = "bold" } },
            command = { a = { fg = "#272822", bg = "#ae81ff", gui = "bold" } },
            inactive = {
                a = { fg = "#f8f8f2", bg = "#49483e", gui = "bold" },
                b = { fg = "#f8f8f2", bg = "#272822" },
                c = { fg = "#f8f8f2", bg = "#272822" },
            },
        }

        require("lualine").setup({
            options = {
                theme = monokai_theme,
                component_separators = { left = "│", right = "│" },
                section_separators = { left = "", right = "" },
                icons_enabled = true,
            },
            sections = {
                lualine_a = {
                    {
                        "mode",
                        separator = { left = "" },
                        right_padding = 2,
                    },
                },
                lualine_b = {
                    "fileformat",
                    "filename",
                    "branch",
                    {
                        "diff",
                        symbols = { added = " ", modified = " ", removed = " " },
                    },
                },
                lualine_c = {
                    function()
                        return require("lsp-progress").progress()
                    end,
                },
                lualine_x = {},
                lualine_y = {
                    {
                        "diagnostics",
                        sources = { "nvim_diagnostic" },
                        symbols = { error = "✘ ", warn = "⚠ ", info = "ℹ " },
                    },
                    {
                        "o:encoding",
                        fmt = string.upper,
                    },
                    "filetype",
                    "progress",
                },
                lualine_z = {
                    {
                        "location",
                        separator = { right = "" },
                        left_padding = 2,
                    },
                },
            },
            inactive_sections = {
                lualine_a = { "filename" },
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = { "location" },
            },
            tabline = {},
            extensions = {},
        })
    end,
}
