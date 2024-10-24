vim.cmd [[
    augroup CursorHighlight
        autocmd!
        autocmd InsertEnter * set cul
        autocmd InsertLeave * set nocul
    augroup END

    highlight Cursor guifg=NONE guibg=#FAFBFC
]]

-- remove trailing spaces on save file
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

-- add blank link in end of file if not exists
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
        local line_count = vim.api.nvim_buf_line_count(0)
        local last_line = vim.api.nvim_buf_get_lines(0, line_count - 1, line_count, false)[1]
        if last_line ~= nil and last_line ~= "" then
            vim.api.nvim_buf_set_lines(0, line_count, line_count, false, { "" })
        end
    end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
    callback = function()
        vim.wo.foldlevel = 99
        vim.wo.foldenable = true
    end,
})

