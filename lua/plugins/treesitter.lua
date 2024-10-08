require('nvim-treesitter.configs').setup({
    ensure_installed = {
        'css',
        'html',
        'javascript',
        'json',
        'lua',
        'markdown',
        'markdown_inline',
        'php',
        'query',
        'scss',
        'tsx',
        'typescript',
        'vim',
        'vimdoc',
        'vue',
        'yaml',
    },

    sync_install = false,
    auto_install = true,

    highlight = {
        enable = true,
    },
})

