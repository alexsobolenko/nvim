-- preview markdown code

return {
    "ellisonleao/glow.nvim",
    config = function()
        require("glow").setup({
            style = "dark",
            border = "rounded",
        })

        -- mappings
        local k = vim.keymap
        local opts = { noremap = true, silent = true }

        opts.desc = "Markdown preview"
        k.set("n", "<leader>mp", ":Glow<CR>", opts)
    end,
}
