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
            -- "beautysh",
            "css-lsp",
            -- "curlylint",
            -- "docker-compose-language-service",
            -- "dockerfile-language-server",
            -- "erb-formatter",
            -- "erb-lint",
            "eslint-lsp",
            "eslint_d",
            "html-lsp",
            "htmlbeautifier",
            "intelephense",
            -- "php-cs-fixer",
            -- "phpcs",
            "phpstan",
            "prettierd",
            "pretty-php",
            -- "shfmt",
            -- "stylelint",
            -- "stylelint-lsp",
            "ts-standard",
            -- "twig-cs-fixer",
            -- "twigcs",
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
