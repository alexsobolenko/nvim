require('nvim-ts-autotag').setup({ })

local params = {
    underline = true,
    virtual_text = {
        spacing = 5,
        severity_limit = 'Warning',
    },
    update_in_insert = true,
}

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, params)

