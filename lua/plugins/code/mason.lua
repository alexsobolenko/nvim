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
        local ensure_installed = {
            "css-lsp",
            "docker-compose-language-service",
            "dockerfile-language-server",
            "eslint",
            "eslint-lsp",
            "html-lsp",
            "intelephense",
            "lua-language-server",
            "php-cs-fixer",
            "phpcs",
            "phpstan",
            "prettierd",
            "pretty-php",
            "selene",
            "shfmt",
            "stylelint",
            "stylelint-lsp",
            "stylua",
            "ts-standard",
            "twigcs",
            "twiggy-language-server",
            "typescript-language-server",
            "vetur-vls",
            "vue-language-server",
        }

        require("mason").setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })

        require("mason-null-ls").setup({
            ensure_installed = ensure_installed,
            automatic_installation = true,
        })
    end,
}
