require("trim").setup({
    ft_blocklist = {
        "markdown",
    },

    patterns = {
        [[%s/\(\n\n\)\n\+/\1/]],
    },

    trim_on_write = true,
    trim_trailing = true,
    trim_last_line = false,
    trim_first_line = true,

    highlight = false,
})

