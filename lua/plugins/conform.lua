return {
    "stevearc/conform.nvim",
    config = function()
        require("conform").setup({
            formatters_by_filetype = {
                bash = { "shfmt" },
                css = { "prettier" },
                html = { "prettier" },
                javascript = { "prettier" },
                json = { "prettier" },
                lua = { "lua-format" },
                php = { "php-cs-fixer" },
                tsx = { "prettier" },
                vue = { "prettier" },
                yaml = { "prettier" },
            },
        })
    end,
}
