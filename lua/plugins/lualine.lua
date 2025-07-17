return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function ()
        require("lualine").setup({
            options = { theme = "tokyonight" },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch", "diff", "diagnostics" },
                lualine_c = {},
                lualine_x = { "filetype", "lsp_status" },
                lualine_y = { "progress" },
                lualine_z = { "location" },
            },
        })
    end
}
