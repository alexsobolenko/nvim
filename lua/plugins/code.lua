return {
    -- autotag
    {
        "windwp/nvim-ts-autotag",
        config = function()
            require("nvim-ts-autotag").setup({})
        end,
    },

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
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")

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
                    { name = "buffer" },
                    { name = "path" },
                    { name = "luasnip" },
                },
            })
        end,
    },

    -- comments
    {
        "tpope/vim-commentary",
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
        },
        config = function()
            local lspconfig = require("lspconfig")

            lspconfig.intelephense.setup({
                filetypes = { "php", "twig" },
                settings = {
                    intelephense = {
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
            lspconfig.cssls.setup({})
            lspconfig.html.setup({})
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

    -- null ls
    {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
            require("null-ls").setup({})
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

    -- surround
    {
        "tpope/vim-surround",
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
