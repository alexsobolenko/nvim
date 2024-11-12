return {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            root_dir = require("null-ls.utils").root_pattern("composer.json", "package.json", "Makefile", ".git"),
            sources = {
                -- formatting
                null_ls.builtins.formatting.eslint,
                null_ls.builtins.formatting.prettier,
                null_ls.builtins.formatting.stylua,
                -- diagnostics
                null_ls.builtins.diagnostics.eslint,
                null_ls.builtins.diagnostics.phpcs.with({
                    command = "vendor/bin/phpcs",
                    method = null_ls.methods.DIAGNOSTICS,
                    diagnostics_format = "[phpcs] #{m} (#{c})",
                    diagnostics_postprocess = function(diagnostic)
                        if diagnostic.message:match("Heredoc") then
                            diagnostic.severity = vim.diagnostic.severity.HINT
                        end
                    end,
                    condition = function(utils)
                        return utils.root_has_file("phpcs.xml")
                    end,
                }),
                null_ls.builtins.diagnostics.phpstan.with({
                    command = "vendor/bin/phpstan",
                    args = { "analyze" },
                    diagnostics_format = "[phpstan] #{m} (#{c})",
                    diagnostics_postprocess = function(diagnostic)
                        if diagnostic.message:match("Heredoc") then
                            diagnostic.severity = vim.diagnostic.severity.HINT
                        end
                    end,
                    condition = function(utils)
                        return utils.root_has_file("phpstan.neon")
                    end,
                }),
                null_ls.builtins.diagnostics.yamllint,
            },
            on_attach = function(client)
                if client.server_capabilities.documentFormattingProvider then
                    vim.cmd([[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]])
                    vim.cmd([[autocmd BufWritePost <buffer> lua vim.api.nvim_buf_set_option(0, 'modified', false)]])
                end
            end,
        })
    end,
}
