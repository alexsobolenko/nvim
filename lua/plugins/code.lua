return {
    -- CMP
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "hrsh7th/cmp-cmdline" },
            { "L3MON4D3/LuaSnip" },
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-nvim-lsp-signature-help" },
            { "onsails/lspkind.nvim" },
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")
            local lspkind = require("lspkind")

            require("luasnip.loaders.from_vscode").lazy_load()

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = {
                    ["<Tab>"] = cmp.mapping.select_next_item(),
                    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                },
                sources = {
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "buffer" },
                    { name = "path" },
                },
                formatting = {
                    format = lspkind.cmp_format({
                        maxwidth = 50,
                        ellipsis_char = "...",
                    }),
                },
            })
        end,
    },

    -- conform
    {
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
    },

    -- LSP
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            { "williamboman/mason.nvim" },
            { "onsails/lspkind-nvim" },
        },
        config = function()
            local lspconfig = require("lspconfig")
            local lspkind = require("lspkind")

            lspkind.init({
                mode = "symbol",
            })

            lspconfig.intelephense.setup({
                flags = {
                    debounce_text_changes = 150,
                },
                filetypes = { "php", "twig" },
                settings = {
                    intelephense = {
                        files = {
                            maxSize = 5000000,
                        },
                        diagnostics = {
                            enable = true,
                        },
                        stubs = {
                            "apache",
                            "bcmath",
                            "bz2",
                            "calendar",
                            "com",
                            "ctype",
                            "curl",
                            "date",
                            "dom",
                            "exif",
                            "fileinfo",
                            "filter",
                            "gd",
                            "gettext",
                            "hash",
                            "iconv",
                            "intl",
                            "json",
                            "libxml",
                            "mbstring",
                            "mysqli",
                            "mysqlnd",
                            "openssl",
                            "pcntl",
                            "pcre",
                            "PDO",
                            "pdo_mysql",
                            "Phar",
                            "readline",
                            "redis",
                            "reflection",
                            "session",
                            "SimpleXML",
                            "sockets",
                            "sodium",
                            "SOAP",
                            "sqlite3",
                            "standard",
                            "tokenizer",
                            "xml",
                            "xmlreader",
                            "xmlwriter",
                            "xsl",
                            "Zend OPcache",
                            "zip",
                            "zlib",
                        },
                    },
                },
            })
            lspconfig.volar.setup({})

            lspconfig.cssls.setup({})

            lspconfig.dockerls.setup({})

            lspconfig.html.setup({})

            lspconfig.ts_ls.setup({})

            lspconfig.yamlls.setup({})
        end,
    },

    -- mason
    {
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
                "erb-formatter",
                "erb-lint",
                "eslint-lsp",
                "eslint_d",
                "html-lsp",
                "htmlbeautifier",
                "intelephense",
                "php-cs-fixer",
                "phpcs",
                "phpstan",
                "prettierd",
                "pretty-php",
                "shfmt",
                "stylelint",
                "stylelint-lsp",
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
    },

    -- null ls
    {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
            local null_ls = require("null-ls")
            local utils = require("null-ls.utils")
            null_ls.setup({
                root_dir = utils.root_pattern("composer.json", "package.json", "Makefile", ".git"),
                diagnostics_format = "#{m} (#{c}) [#{s}]",
                sources = {
                    null_ls.builtins.diagnostics.phpcs.with({
                        command = "vendor/bin/phpcs",
                        method = null_ls.methods.DIAGNOSTICS,
                    }),
                },
            })
        end,
    },

    -- treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "bash",
                    "css",
                    "csv",
                    "diff",
                    "dockerfile",
                    "editorconfig",
                    "git_config",
                    "git_rebase",
                    "gitattributes",
                    "gitcommit",
                    "gitignore",
                    "graphql",
                    "html",
                    "ini",
                    "javascript",
                    "jsdoc",
                    "json",
                    "json5",
                    "jsonc",
                    "lua",
                    "luadoc",
                    "make",
                    "markdown",
                    "markdown_inline",
                    "nginx",
                    "php",
                    "php_only",
                    "phpdoc",
                    "regex",
                    "scss",
                    "sql",
                    "tsx",
                    "typescript",
                    "twig",
                    "vim",
                    "vue",
                    "xml",
                    "yaml",
                },
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                indent = {
                    enable = true,
                },
            })
        end,
    },
}
