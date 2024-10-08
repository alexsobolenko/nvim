local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Setup language servers.
local lspconfig = require('lspconfig')
lspconfig.ts_ls.setup({ })
lspconfig.phpactor.setup({ })
lspconfig.intelephense.setup({ })
lspconfig.cssls.setup({
    capabilities = capabilities
})
lspconfig.eslint.setup({
    on_attach = function(client, bufnr)
        vim.api.nvim_create_autocmd('BufWritePre', {
            buffer = bufnr,
            command = 'EslintFixAll',
        })
    end,
})
lspconfig.vuels.setup({ })
lspconfig.emmet_language_server.setup({
    filetypes = {
        'css',
        'html',
        'javascript',
        'javascriptreact',
        'php',
        'sass',
        'scss',
        'tsx',
        'vue',
    },
    init_options = {
        includeLanguages = {},
        excludeLanguages = {},
        extensionsPath = {},
        preferences = {},
        showAbbreviationSuggestions = true,
        showExpandedAbbreviation = 'always',
        showSuggestionsAsSnippets = false,
        syntaxProfiles = {},
        variables = {},
    },
})

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<leader>lD', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>ld', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        local opts = {buffer = ev.buf}
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gR', vim.lsp.buf.references, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, opts)
        vim.keymap.set({'n', 'v'}, '<leader>la', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', '<leader>lf', function() vim.lsp.buf.format { async = true } end, opts)
    end
})

