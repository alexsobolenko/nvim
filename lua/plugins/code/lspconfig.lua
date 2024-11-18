-- language server protocol

return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "hrsh7th/nvim-cmp" },
        { "williamboman/mason.nvim" },
        { "onsails/lspkind-nvim" },
        { "hrsh7th/cmp-nvim-lsp" },
        { "ray-x/lsp_signature.nvim" },
    },
    config = function()
        local lspconfig = require("lspconfig")
        local lspkind = require("lspkind")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")
        local capabilities = cmp_nvim_lsp.default_capabilities()
        local k = vim.keymap

        local function get_php_version_from_composer()
            local file = io.open("composer.json", "r")
            if not file then
                return nil
            end

            local content = file:read("*a")
            file:close()

            return content:match('"php"%s*:%s*"[><=%^~]*%s*(%d+%.%d+)')
        end

        lspkind.init({
            mode = "symbol",
        })

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                local opts = { buffer = ev.buf, silent = true }

                opts.desc = "Show LSP references"
                k.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

                opts.desc = "Go to declaration"
                k.set("n", "gD", function()
                    local clients = vim.lsp_get_clients({ bufnr = 0 })
                    if #clients > 0 and clients[1].server_capabilities.declarationProvider then
                        vim.lsp.buf.declaration()
                    else
                        vim.lsp.buf.definition()
                    end
                end, opts)

                opts.desc = "Show LSP definitions"
                k.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

                opts.desc = "Show LSP implementations"
                k.set("n", "gi", function()
                    local clients = vim.lsp_get_clients({ bufnr = 0 })
                    if #clients > 0 and clients[1].server_capabilities.implementationProvider then
                        vim.cmd("Telescope lsp_implementations")
                    else
                        vim.cmd("Telescope lsp_references")
                    end
                end, opts)

                opts.desc = "Show LSP type definitions"
                k.set("n", "gt", function()
                    local clients = vim.lsp_get_clients({ bufnr = 0 })
                    if #clients > 0 and clients[1].server_capabilities.typeDefinitionProvider then
                        vim.cmd("Telescope lsp_type_definitions")
                    else
                        vim.cmd("Telescope lsp_definitions")
                    end
                end, opts)

                opts.desc = "See available code actions"
                k.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

                opts.desc = "Smart rename"
                k.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

                opts.desc = "Show buffer diagnostics"
                k.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

                opts.desc = "Show line diagnostics"
                k.set("n", "<leader>d", vim.diagnostic.open_float, opts)

                opts.desc = "Go to previous diagnostic"
                k.set("n", "[d", "<cmd>vim.diagnostic.goto_prev()<CR>", opts)

                opts.desc = "Go to next diagnostic"
                k.set("n", "]d", "<cmd>vim.diagnostic.goto_next()<CR>", opts)

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

        lspconfig.lua_ls.setup({
            capabilities = capabilities,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                        library = vim.api.nvim_get_runtime_file("", true),
                    },
                    telemetry = {
                        enable = false,
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
    end,
}
