return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},

    config = function ()
        require("tokyonight").setup({
            style = "night",

            terminal_colors = true,
            styles = {
                comments = { italic = true },
                keywords = { italic = true },
                sidebars = "dark",
                floats = "dark",
            },
        })
        vim.cmd("colorscheme tokyonight-night")
    end
}
