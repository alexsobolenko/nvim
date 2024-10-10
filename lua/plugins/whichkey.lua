local wk = require("which-key")

wk.setup({
    preset = "modern",
})

wk.add({
    { "<leader>f", group = "Find" },
    { "<leader>ff", desc = "Find file" },
    { "<leader>fb", desc = "Find buffer" },
    { "<leader>fh", desc = "Find help" },
    { "<leader>fw", desc = "Find text" },

    { "<leader>e", group = "File Manager" },

    { "<leader>o", group = "Git status" },

    { "<leader>x", group = "Close buffer" },

    { "<leader>w", group = "Save" },

    { "<leader>t", group = "Terminal" },
    { "<leader>tf", desc = "Float terminal" },
    { "<leader>th", desc = "Horizontal terminal" },

    { "<leader>h", group = "No highlight" },

    { "<leader>g", group = "Git" },
    { "<leader>gb", desc = "Branches" },
    { "<leader>gc", desc = "Commits" },
    { "<leader>gs", desc = "Status" },

    { "<leader>c", group = "Comment|Outline" },
    { "<leader>cl", desc = "Comment line" },
    { "<leader>cs", desc = "Symbols Outline" },

    { "<leader>l", group = "LSP" },
    { "<leader>ld", desc = "Diagnostic" },
    { "<leader>lD", desc = "Hover diagnostic" },
    { "<leader>lf", desc = "Format" },
    { "<leader>lr", desc = "Rename" },
    { "<leader>la", desc = "Action" },
    { "<leader>ls", desc = "Symbol" },
})

