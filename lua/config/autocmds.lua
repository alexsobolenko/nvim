vim.cmd [[
    augroup CursorHighlight
        autocmd!
        autocmd InsertEnter * set cul
        autocmd InsertLeave * set nocul
    augroup END

    highlight Cursor guifg=NONE guibg=#FAFBFC
]]

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

vim.api.nvim_create_autocmd("BufReadPost", {
    callback = function()
        vim.wo.foldlevel = 99
        vim.wo.foldenable = true
    end,
})
