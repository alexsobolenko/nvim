-- package manager for LSP, DAP, linters and formatters

return {
    "williamboman/mason.nvim",
    dependencies = {
        { "jose-elias-alvarez/null-ls.nvim" },
        { "williamboman/mason-lspconfig.nvim" },
        { "jay-babu/mason-null-ls.nvim" },
    },
    build = ":MasonUpdate",
    config = function()
        local m = require("extras.mason")
        local icons = require("extras.icons")
        require("mason").setup({
            ui = {
                icons = icons.mason,
            },
        })

        require("mason-null-ls").setup({
            ensure_installed = m.ensure_installed,
            automatic_installation = true,
        })
    end,
}
