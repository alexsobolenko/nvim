return {
    "folke/which-key.nvim",
    dependencies = {
        { "nvim-tree/nvim-web-devicons" },
        {
            "echasnovski/mini.icons",
            version = "*",
        },
    },
    config = function()
        require("which-key").setup {
            preset = "modern",
        }
    end
}

