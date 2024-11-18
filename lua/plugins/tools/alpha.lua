return {
    "goolord/alpha-nvim",
    event = { "VimEnter" },
    dependencies = {
        { "nvim-tree/nvim-web-devicons" },
        { "echasnovski/mini.icons" },
        { "nvim-lua/plenary.nvim" },
    },
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        local info = function()
            local status = "󰂖 %d  %s %d.%d.%d  %s"
            local plugins = #vim.tbl_keys(require("lazy").plugins())
            local v = vim.version()
            local platform = vim.fn.has("win32") == 1 and "" or ""

            return string.format(status, plugins, platform, v.major, v.minor, v.patch, os.date(" %d.%m.%Y"))
        end

        dashboard.section.header.val = {
            "",
            "",
            "",
            "ooooo      ooo oooooooooooo   .oooooo.   oooooo     oooo ooooo ooo        ooooo",
            "`888b.     `8' `888'     `8  d8P'  `Y8b   `888.     .8'  `888' `88.       .888'",
            " 8 `88b.    8   888         888      888   `888.   .8'    888   888b     d'888 ",
            " 8   `88b.  8   888oooo8    888      888    `888. .8'     888   8 Y88. .P  888 ",
            " 8     `88b.8   888    '    888      888     `888.8'      888   8  `888'   888 ",
            " 8       `888   888       o `88b    d88'      `888'       888   8    Y     888 ",
            "o8o        `8  o888ooooood8  `Y8bood8P'        `8'       o888o o8o        o888o",
            "",
            "",
            "",
        }
        dashboard.section.buttons.val = {
            dashboard.button("e", "󰙅  > Open tree", ":Neotree float<CR>"),
            dashboard.button("f", "󰈞  > Find files", ":Telescope find_files<CR>"),
            dashboard.button("w", "  > Find text", ":Telescope live_grep<CR>"),
            dashboard.button("b", "  > Git Braches", ":Telescope git_branches<CR>"),
            dashboard.button("l", "  > Lazy", ":Lazy<CR>"),
            dashboard.button("m", "  > Mason", ":Mason<CR>"),
            dashboard.button("q", "󰈆  > Quit", ":q<CR>"),
        }
        dashboard.section.footer.val = {
            info(),
        }

        alpha.setup(dashboard.opts)

        vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
    end,
}
