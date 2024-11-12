return {
    "ellisonleao/glow.nvim",
    keys = {
        { "<leader>mp", ":Glow<CR>", mode = "n", desc = "Markdown Preview" },
    },
    config = function()
        require("glow").setup({
            style = "dark",
            border = "rounded",
        })
    end,
}
