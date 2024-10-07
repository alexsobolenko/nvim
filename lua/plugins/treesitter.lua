require('nvim-treesitter.configs').setup({
    ensure_installed = {
        'html',
        'javascript',
        'lua',
        'markdown',
        'markdown_inline',
        'php',
        'query',
        'ruby',
        'scss',
        'tsx',
        'typescript',
        'vim',
        'vimdoc',
        'vue',
        'yaml'
    },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
    },
})

