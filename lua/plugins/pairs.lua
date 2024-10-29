return  {
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
}
