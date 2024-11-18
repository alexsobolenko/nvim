-- IDE status line

return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        { "nvim-tree/nvim-web-devicons" },
    },
    config = function()
        local monokai_theme = {
            normal = {
                a = { fg = "#222327", bg = "#F39660", gui = "bold" },
                b = { fg = "#E2E2E3", bg = "#55393D" },
                c = { fg = "#E2E2E3", bg = "#222327" },
            },
            insert = { a = { fg = "#222327", bg = "#A7DF78", gui = "bold" } },
            visual = { a = { fg = "#222327", bg = "#85D3F2", gui = "bold" } },
            replace = { a = { fg = "#222327", bg = "#FF6077", gui = "bold" } },
            command = { a = { fg = "#222327", bg = "#B39DF3", gui = "bold" } },
            inactive = {
                a = { fg = "#E2E2E3", bg = "#55393D", gui = "bold" },
                b = { fg = "#E2E2E3", bg = "#222327" },
                c = { fg = "#E2E2E3", bg = "#222327" },
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
