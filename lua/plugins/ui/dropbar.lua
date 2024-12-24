-- breadcrumbs

return {
    "Bekaboo/dropbar.nvim",
    config = function()
        local dropbar_api = require("dropbar.api")

        -- mappings
        local k = vim.keymap
        local opts = { noremap = true, silent = true }

        opts.desc = "Pick symbols in winbar"
        k.set("n", "<leader>;", dropbar_api.pick, opts)

        opts.desc = "Go to start of current context"
        k.set("n", "[;", dropbar_api.goto_context_start, opts)

        opts.desc = "Select next context"
        k.set("n", "];", dropbar_api.select_next_context, opts)
    end,
}
