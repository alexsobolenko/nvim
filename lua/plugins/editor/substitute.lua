-- manipulage substitutions

return {
    "gbprod/substitute.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local substitute = require("substitute")
        substitute.setup()

        -- mappings
        local k = vim.keymap
        local opts = { noremap = true, silent = true }

        opts.desc = "Substitute with notion"
        k.set("n", "s", substitute.operator, opts)

        opts.desc = "Substitute line"
        k.set("n", "ss", substitute.line, opts)

        opts.desc = "Substitute to end of line"
        k.set("n", "S", substitute.eol, opts)

        opts.desc = "Substitute in visual mode"
        k.set("x", "s", substitute.visual, opts)
    end,
}
