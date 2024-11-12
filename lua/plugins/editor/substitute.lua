return {
    "gbprod/substitute.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local substitute = require("substitute")
        local k = vim.keymap

        substitute.setup()

        k.set("n", "s", substitute.operator, { desc = "Substitute with motion" })
        k.set("n", "ss", substitute.line, { desc = "Substitute line" })
        k.set("n", "S", substitute.eol, { desc = "Substitute to end of line" })
        k.set("x", "s", substitute.visual, { desc = "Substitute in visual mode" })
    end,
}
