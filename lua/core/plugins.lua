-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    local out = vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", 'ErrorMsg' },
            { out, 'WarningMsg' },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end

vim.opt.rtp:prepend(lazypath)

-- Install plugins
require('lazy').setup({
    { 'phaazon/hop.nvim' },
    {
        'nvim-neo-tree/neo-tree.nvim',
        branch = 'v3.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons',
            'MunifTanjim/nui.nvim',
            's1n7ax/nvim-window-picker',
        },
    },
    { 'nvim-treesitter/nvim-treesitter' },
    { 'neovim/nvim-lspconfig' },
    { 'joshdick/onedark.vim' },
    { 'tanvirtin/monokai.nvim' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-cmdline' },
    { 'hrsh7th/cmp-vsnip' },
    { 'hrsh7th/vim-vsnip' },
    { 'hrsh7th/vim-vsnip-integ' },
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-nvim-lsp-signature-help' },
    { 'williamboman/mason.nvim' },
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
    },
    { 'fraso-dev/nvim-listchars', config = true },
    { 'tpope/vim-surround' },
    { 'cappyzawa/trim.nvim' },
    { 'lewis6991/gitsigns.nvim' },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
            'linrongbin16/lsp-progress.nvim',
        },
    },
    {
        'akinsho/toggleterm.nvim',
        version = '*',
        config = true,
    },
    { 'windwp/nvim-autopairs' },
    { 'Djancyp/outline' },
    { 'terrortylor/nvim-comment' },
    { 'windwp/nvim-ts-autotag' },
    {
        'akinsho/bufferline.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
    },
    {
        'linrongbin16/lsp-progress.nvim',
        event = { 'VimEnter' },
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
    },
    {
        'glepnir/dashboard-nvim',
        event = { 'VimEnter' },
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
    },
    {
        'folke/which-key.nvim',
        event = { 'VeryLazy' },
    },
})

