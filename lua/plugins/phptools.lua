return {
    "pcyman/phptools.nvim",
    keys = {
        {
            "<leader>mg",
            function() require('phptools.getset').generate_getset('v') end,
            mode = "n",
        },
    },
    config = function()
        require('phptools').setup({})
    end,
}
