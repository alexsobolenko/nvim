return {
    "rayburgemeestre/phpfolding.vim",
    config = function()
        vim.g.php_fold_method = "indent"
        vim.wo.foldlevel = 99
        vim.wo.foldenable = true
    end,
}

