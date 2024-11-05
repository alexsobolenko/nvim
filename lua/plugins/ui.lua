return {
    -- bufferline
    {
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
                            padding = 1,
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
                        bottom = 0
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
                        normal = 'BufferLine',
                        buffer_selected = 'BufferLine_BufferSelected',
                        buffer_visible = 'BufferLine_BufferVisible',
                        buffer_close = 'BufferLine_BufferClose',
                        buffer_directory = 'Directory',
                        buffer_modified = 'Modified',
                        buffer_not_saved = 'NonSaved',
                        buffer_insert = 'Insert',
                        buffer_visual = 'Visual',
                        buffer_leaf = 'Leaf',
                        buffer_expand = 'Expandable',
                        buffer_collapse = 'Collapsible',
                        indicator_selected = 'BufferLine_IndicatorSelected',
                        indicator_normal = 'BufferLine_IndicatorNormal',
                    },
                },
            })

            vim.api.nvim_set_keymap("n", "<Tab>", ":BufferLineCycleNext<CR>", {
                noremap = true,
                silent = true,
                desc = "Next buffer",
            })
            vim.api.nvim_set_keymap("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", {
                noremap = true,
                silent = true,
                desc = "Previous buffer",
            })
            vim.api.nvim_set_keymap("n", "<leader>bc", ":bdelete<CR>", {
                noremap = true,
                silent = true,
                desc = "Close buffer",
            })
            for i = 1, 9 do
                vim.api.nvim_set_keymap("n", "<leader>" .. i, ":BufferLineGoToBuffer " .. i .. "<CR>", {
                    noremap = true,
                    silent = true,
                    desc = "Go to buffer " .. i,
                })
            end
        end,
    },

    -- dashboard
    {
        "glepnir/dashboard-nvim",
        event = "VimEnter",
        config = function()
            require("dashboard").setup({
                theme = "doom",
                config = {
                    header = {
                        "", "", "", "", "", "", "", "",
                        "ooooo      ooo oooooooooooo   .oooooo.   oooooo     oooo ooooo ooo        ooooo",
                        "`888b.     `8' `888'     `8  d8P'  `Y8b   `888.     .8'  `888' `88.       .888'",
                        " 8 `88b.    8   888         888      888   `888.   .8'    888   888b     d'888 ",
                        " 8   `88b.  8   888oooo8    888      888    `888. .8'     888   8 Y88. .P  888 ",
                        " 8     `88b.8   888    '    888      888     `888.8'      888   8  `888'   888 ",
                        " 8       `888   888       o `88b    d88'      `888'       888   8    Y     888 ",
                        "o8o        `8  o888ooooood8  `Y8bood8P'        `8'       o888o o8o        o888o",
                        "", "", "", "", "", "",
                    },
                    center = {
                        {
                            icon = "󰙅   ",
                            icon_hl = "Title",
                            desc = "Open tree",
                            desc_hl = "String",
                            key = "e",
                            key_hl = "Number",
                            action = ":Neotree float",
                        },
                        {
                            icon = "󰈞   ",
                            icon_hl = "Title",
                            desc = "Find files",
                            desc_hl = "String",
                            key = "f",
                            key_hl = "Number",
                            action = ":Telescope find_files",
                        },
                        {
                            icon = "   ",
                            icon_hl = "Title",
                            desc = "Find text",
                            desc_hl = "String",
                            key = "w",
                            key_hl = "Number",
                            action = ":Telescope live_grep",
                        },
                        {
                            icon = "   ",
                            icon_hl = "Title",
                            desc = "Git Braches",
                            desc_hl = "String",
                            key = "b",
                            key_hl = "Number",
                            action = ":Telescope git_branches",
                        },
                        {
                            icon = "   ",
                            icon_hl = "Title",
                            desc = "Lazy",
                            desc_hl = "String",
                            key = "l",
                            key_hl = "Number",
                            action = ":Lazy",
                        },
                        {
                            icon = "󰈆   ",
                            icon_hl = "Title",
                            desc = "Quit",
                            desc_hl = "String",
                            key = "q",
                            key_hl = "Number",
                            action = ":q",
                        },
                    },
                },
            })
        end,
    },

    -- glow
    {
        "ellisonleao/glow.nvim",
        keys = {
            { "<leader>mp", ":Glow<CR>", mode = "n", desc ="Markdown Preview" },
        },
        config = function()
            require("glow").setup({
                style = "dark",
                border = "rounded",
            })
        end,
    },

    -- listchars
    {
        "fraso-dev/nvim-listchars",
        config = function()
            require("nvim-listchars").setup({
                listchars = {
                    trail = "-",
                    eol = "↲",
                    tab = "» ",
                },
                exclude_filetypes = { "markdown" },
            })
        end,
    },

    -- lualine
    {
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
    },

    -- noice (command line)
    {
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
    },

    -- notificatins
    {
        "rcarriga/nvim-notify",
        keys = {
            {
                "<leader>un",
                function() require("notify").dismiss({ silent = true, pending = true }) end,
                desc = "Dismiss All Notifications",
            },
        },
        opts = {
            stages = "static",
            timeout = 3000,
            max_height = function()
                return math.floor(vim.o.lines * 0.75)
            end,
            max_width = function()
                return math.floor(vim.o.columns * 0.75)
            end,
            on_open = function(win)
                vim.api.nvim_win_set_config(win, { zindex = 100 })
            end,
        },
        init = function()
            vim.notify = require("notify")
        end,
    },

    -- LSP progress
    {
        "linrongbin16/lsp-progress.nvim",
        config = function()
            require("lsp-progress").setup({
                display_components = {
                    "lsp_client_name",
                    "spinner",
                    "message",
                },
                separators = {
                    component = " ",
                    progress = " | ",
                    percentage = { pre = "", post = "%% " },
                    title = { pre = "", post = ": " },
                    lsp_client_name = { pre = "[", post = "]" },
                    spinner = { pre = "", post = "" },
                    message = {
                        commenced = "In Progress",
                        completed = "Completed",
                    },
                },
                timer = {
                    spinner = 100,
                    progress_enddelay = 300,
                    progress_debounced = 100,
                },
                spinner_symbols = { "◜", "◠", "◝", "◞", "◡", "◟" },
            })
        end,
    },

    -- todo comments
    {
        "folke/todo-comments.nvim",
        cmd = {
            "TodoTrouble",
            "TodoTelescope",
        },
        event = "BufRead",
        keys = {
            { "]t", function() require("todo-comments").jump_next() end, desc = "Next Todo Comment" },
            { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous Todo Comment" },
            { "<leader>xt", "<cmd>Trouble todo toggle<cr>", desc = "Todo (Trouble)" },
            { "<leader>xT", "<cmd>Trouble todo toggle filter = {tag = {TODO,FIX,FIXME}}<cr>", desc = "Todo/Fix/Fixme (Trouble)" },
            { "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Todo" },
            { "<leader>sT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme" },
        },
    },

    -- trouble
    {
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
    },

    -- virtcolumn
    {
        "lukas-reineke/virt-column.nvim",
        config = function()
            vim.api.nvim_create_autocmd("FileType", {
                pattern = "*",
                callback = function()
                    if vim.bo.filetype ~= "dashboard" then
                        require("virt-column").setup({
                            char = "│",
                            virtcolumn = "120",
                        })
                    end
                end,
            })
        end,
    },

    -- which key
    {
        "folke/which-key.nvim",
        dependencies = {
            { "nvim-tree/nvim-web-devicons" },
            { "echasnovski/mini.icons", version = "*" },
        },
        config = function()
            require("which-key").setup({
                preset = "modern",
            })
        end,
    },
}
