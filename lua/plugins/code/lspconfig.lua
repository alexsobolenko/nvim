-- language server protocol

return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "hrsh7th/nvim-cmp" },
        { "williamboman/mason.nvim" },
        { "onsails/lspkind-nvim" },
        { "hrsh7th/cmp-nvim-lsp" },
        { "ray-x/lsp_signature.nvim" },
        { "nvim-lua/plenary.nvim" },
    },
    config = function()
        local utils = require("extras.utils")
        local lspconfig = require("lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")
        local capabilities = cmp_nvim_lsp.default_capabilities()
        local k = vim.keymap

        require("lspkind").init({ mode = "symbol" })

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                local opts = { buffer = ev.buf, silent = true }

                opts.desc = "Show LSP references"
                k.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

                opts.desc = "Go to declaration"
                k.set("n", "gD", vim.lsp.buf.declaration, opts)

                opts.desc = "Show LSP definitions"
                k.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

                opts.desc = "Show LSP implementations"
                k.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

                opts.desc = "Show LSP type definitions"
                k.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

                opts.desc = "See available code actions"
                k.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

                opts.desc = "Smart rename"
                k.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

                opts.desc = "Show buffer diagnostics"
                k.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

                opts.desc = "Show line diagnostics"
                k.set("n", "<leader>d", vim.diagnostic.open_float, opts)

                opts.desc = "Go to previous diagnostic"
                k.set("n", "[d", "<cmd>vim.diagnostic.goto_prev()<CR>", opts)

                opts.desc = "Go to next diagnostic"
                k.set("n", "]d", "<cmd>vim.diagnostic.goto_next()<CR>", opts)

                opts.desc = "Show documentation for what is under cursor"
                k.set("n", "K", vim.lsp.buf.hover, opts)

                opts.desc = "Restart LSP"
                k.set("n", "<leader>rs", ":LspRestart<CR>", opts)
            end,
        })

        local base_config = {
            capabilities = capabilities,
        }
        local lspconfig_dir = vim.fn.stdpath("config") .. "/lua/extras/lspconfig"
        for lsp_name, extra_config in pairs(utils.require_files_to_table(lspconfig_dir, true)) do
            lspconfig[lsp_name].setup(vim.tbl_extend("force", base_config, extra_config))
        end
    end,
}
