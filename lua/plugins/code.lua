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
            { "hrsh7th/cmp-nvim-lsp" },
            { "ray-x/lsp_signature.nvim" },
        },
        config = function()
            local function get_php_version_from_composer()
                local file = io.open("composer.json", "r")
                if not file then
                    return nil
                end

                local content = file:read("*a")
                file:close()

                return content:match('"php"%s*:%s*"[><=%^~]*%s*(%d+%.%d+)')
            end

            local lspconfig = require("lspconfig")
            local lspkind = require("lspkind")
            local cmp_nvim_lsp = require("cmp_nvim_lsp")
            local capabilities = cmp_nvim_lsp.default_capabilities()
            local k = vim.keymap

            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(ev)
                    local opts = { buffer = ev.buf, silent = true }

                    opts.desc = "Show LSP references"
                    k.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

                    opts.desc = "Go to declaration"
                    k.set("n", "gD", vim.lsp.buf.declaration, opts)

                    opts.desc = "Show LSP definitions"
                    k.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

                    opts.desc = "Show LSP implementations"
                    k.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

                    opts.desc = "Show LSP type definitions"
                    k.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

                    opts.desc = "See available code actions"
                    k.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

                    opts.desc = "Smart rename"
                    k.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

                    opts.desc = "Show buffer diagnostics"
                    k.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

                    opts.desc = "Show line diagnostics"
                    k.set("n", "<leader>d", vim.diagnostic.open_float, opts)

                    opts.desc = "Go to previous diagnostic"
                    k.set("n", "[d", vim.diagnostic.goto_prev, opts)

                    opts.desc = "Go to next diagnostic"
                    k.set("n", "]d", vim.diagnostic.goto_next, opts)

                    opts.desc = "Show documentation for what is under cursor"
                    k.set("n", "K", vim.lsp.buf.hover, opts)

                    opts.desc = "Restart LSP"
                    k.set("n", "<leader>rs", ":LspRestart<CR>", opts)
                end,
            })

            lspconfig.cssls.setup({
                capabilities = capabilities,
            })

            lspconfig.dockerls.setup({
                capabilities = capabilities,
            })

            lspconfig.html.setup({
                capabilities = capabilities,
            })

            lspconfig.intelephense.setup({
                capabilities = capabilities,
                flags = {
                    debounce_text_changes = 150,
                },
                filetypes = { "php", "twig" },
                settings = {
                    intelephense = {
                        environment = {
                            phpVersion = get_php_version_from_composer() or "7.4",
                        },
                        files = {
                            maxSize = 5000000,
                        },
                        diagnostics = {
                            enable = true,
                        },
                        stubs = {
                            "Core",
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
                            "Reflection",
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

            lspconfig.ts_ls.setup({
                capabilities = capabilities,
            })

            lspconfig.twiggy_language_server.setup({
                capabilities = capabilities,
            })

            lspconfig.vuels.setup({
                capabilities = capabilities,
            })

            lspconfig.yamlls.setup({
                capabilities = capabilities,
            })

            lspkind.init({
                mode = "symbol",
            })
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
                sources = {
                    null_ls.builtins.diagnostics.phpcs.with({
                        command = "vendor/bin/phpcs",
                        method = null_ls.methods.DIAGNOSTICS,
                        diagnostics_format = "[phpcs] #{m} (#{c})",
                        condition = function(utils)
                            return utils.root_has_file("phpcs.xml")
                        end,
                    }),
                    null_ls.builtins.diagnostics.phpstan.with({
                        command = "vendor/bin/phpstan",
                        args = { "analyze" },
                        diagnostics_format = "[phpstan] #{m} (#{c})",
                        condition = function(utils)
                            return utils.root_has_file("phpstan.neon")
                        end,
                    }),
                },
                on_attach = function(client)
                    if client.server_capabilities.documentFormattingProvider then
                        vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format({ async = true })")
                    end
                end,
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
