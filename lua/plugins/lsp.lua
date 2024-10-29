return {
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
                    files = {
                        associations = { "*.twig" },
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
}
