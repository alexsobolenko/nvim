return {
    -- autotag
    {
        "windwp/nvim-ts-autotag",
        config = function()
            require("nvim-ts-autotag").setup({})
        end,
    },

    -- comments
    {
        "tpope/vim-commentary",
    },

    -- neogen
    {
        "danymat/neogen",
        dependencies = {
            { "nvim-treesitter/nvim-treesitter" },
        },
        keys = {
            {
                "<Leader>gd",
                ":lua require('neogen').generate({ type = 'func' })<CR>",
                mode = "n",
                desc = "Generate docblock",
                { noremap = true, silent = true }
            },
        },
        config = function()
            require('neogen').setup({
                enabled = true,
                languages = {
                    php = {
                        template = {
                            annotation_convention = "phpdoc",
                            types = true,
                        },
                    },
                },
            })
        end,
    },

    -- pairs
    {
        "echasnovski/mini.pairs",
        config = function()
            require("mini.pairs").setup({
                mappings = {
                    ["'"] = { insert = "'", delete = "'" },
                    ['"'] = { insert = '"', delete = '"' },
                    ["("] = { insert = "(", delete = ")" },
                    ["{"] = { insert = "{", delete = "}" },
                    ["["] = { insert = "[", delete = "]" },
                },
                ignore_blank_line = true,
                enable = true,
            })
        end,
    },

    -- substitute
    {
        "gbprod/substitute.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local substitute = require("substitute")
            local k = vim.keymap

            substitute.setup({})

            k.set("n", "s", substitute.operator, { desc ="Substitute with motion" })
            k.set("n", "ss", substitute.line, { desc ="Substitute line" })
            k.set("n", "S", substitute.eol, { desc ="Substitute to end of line" })
            k.set("x", "s", substitute.visual, { desc ="Substitute in visual mode" })
        end,
    },

    -- surround
    {
        "tpope/vim-surround",
    },
}
