return {
    -- php easy
    {
        "ta-tikoma/php.easy.nvim",
        dependencies = {
            { "L3MON4D3/LuaSnip" },
        },
        keys = {
            { "-b", "<CMD>PHPEasyDocBlock<CR>", ft = "php", mode = "n", desc = "PHP create empty docblock" },
            {"--i", "<CMD>PHPEasyInitInterface<CR>", ft = "php", mode = "n", desc = "PHP init interface" },
            {"--c", "<CMD>PHPEasyInitClass<CR>", ft = "php", mode = "n", desc = "PHP init class" },
            {"--ac", "<CMD>PHPEasyInitAbstractClass<CR>", ft = "php", mode = "n", desc = "PHP init abstract class" },
            {"--t", "<CMD>PHPEasyInitTrait<CR>", ft = "php", mode = "n", desc = "PHP init trait" },
            {"--e", "<CMD>PHPEasyInitEnum<CR>", ft = "php", mode = "n", desc = "PHP init enum" },
            {"__", "<CMD>PHPEasyAppendConstruct<CR>", ft = "php", mode = "n", desc = "PHP init empty constructor" },
        },
        opts = {
            onAppend = {
                engine = "LuaSnip",
            },
        },
        config = true,
    },

    -- php tools
    {
        "pcyman/phptools.nvim",
        keys = {
            { "<leader>gg", ":PhpToolsGetSet<CR>", mode = "n", desc = "PHP generate getters and setters" },
        },
        config = function()
            require('phptools').setup({})
        end,
    },
}
