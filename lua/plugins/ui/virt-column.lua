return {
    "lukas-reineke/virt-column.nvim",
    config = function()
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "*",
            callback = function()
                if vim.bo.filetype ~= "dashboard" then
                    require("virt-column").setup({
                        char = "│",
                        virtcolumn = "120",
                    })
                end
            end,
        })
    end,
}
