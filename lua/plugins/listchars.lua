require("nvim-listchars").setup({
    save_state = false,
    listchars = {
        trail = "-",
        eol = "↲",
        tab = "» ",
    },
    exclude_filetypes = { "markdown" },
})

