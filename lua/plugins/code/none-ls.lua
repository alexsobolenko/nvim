-- diagnosting and formatting

return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            root_dir = require("null-ls.utils").root_pattern("composer.json", "package.json", "Makefile", ".git"),
            diagnostics_format = "#{m} (#{c}) [#{s}]",
            sources = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.diagnostics.eslint,
                null_ls.builtins.diagnostics.phpcs.with({
                    prefer_local = "vendor/bin",
                    method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
                    condition = function(utils)
                        return utils.root_has_file("phpcs.xml")
                    end,
                }),
                null_ls.builtins.diagnostics.phpstan.with({
                    prefer_local = "vendor/bin",
                    method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
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