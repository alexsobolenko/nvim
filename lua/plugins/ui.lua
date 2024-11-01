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
            require("nvim-listchars").setup {
                listchars = {
                    trail = "-",
                    eol = "↲",
                    tab = "» ",
                },
                exclude_filetypes = {
                    "markdown"
                },
            }
            vim.cmd("ListcharsEnable")
        end,
    },

    -- lualine
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            { "nvim-tree/nvim-web-devicons" },
        },
        config = function()
            require("lualine").setup({
                options = {
                    theme = "onedark",
                    section_separators = { left = "", right = "" },
                    component_separators = { left = "", right = "" },
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
                        "filename",
                        "branch",
                        require("lsp-progress").progress,
                    },
                    lualine_c = { "fileformat" },
                    lualine_x = {},
                    lualine_y = { "filetype", "progress" },
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
    -- TODO: replace keys to mappings config
    {
        "folke/todo-comments.nvim",
        cmd = {
            "TodoTrouble",
            "TodoTelescope",
        },
        event = "BufRead",
        keys = {
            {
                "]t",
                function() require("todo-comments").jump_next() end,
                desc = "Next Todo Comment",
            },
            {
                "[t",
                function() require("todo-comments").jump_prev() end,
                desc = "Previous Todo Comment",
            },
            {
                "<leader>xt",
                "<cmd>Trouble todo toggle<cr>",
                desc = "Todo (Trouble)",
            },
            {
                "<leader>xT",
                "<cmd>Trouble todo toggle filter = {tag = {TODO,FIX,FIXME}}<cr>",
                desc = "Todo/Fix/Fixme (Trouble)",
            },
            {
                "<leader>st",
                "<cmd>TodoTelescope<cr>",
                desc = "Todo",
            },
            {
                "<leader>sT",
                "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>",
                desc = "Todo/Fix/Fixme",
            },
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
