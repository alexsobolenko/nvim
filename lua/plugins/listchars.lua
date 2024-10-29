return {
    "fraso-dev/nvim-listchars",
    config = function()
        require("nvim-listchars").setup {
            listchars = {
                trail = "-",
                eol = "↲",
                tab = "» ",
            },
            exclude_filetypes = {
                "markdown"
            },
        }
        vim.cmd("ListcharsEnable")
    end,
}
