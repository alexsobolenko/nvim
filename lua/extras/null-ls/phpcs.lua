-- phpcs config for null-ls

local null_ls = require("null-ls")

return {
    prefer_local = "vendor/bin",
    method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
    condition = function(utils)
        return utils.root_has_file("phpcs.xml")
    end,
}
