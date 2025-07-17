return {
    "nvim-treesitter/nvim-treesitter",
    config = function ()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "c",
                "markdown",
                "lua",
                "python",
                "rust",
            },

            sync_install = false,

            auto_install = true,

            ingore_install = { "javascript" },

            indent = {
                enable = true
            },

            highlight = {
                enable = true,
                disable = {},
                additional_vim_regex_highlighting = { "markdown" },
            }
        })
    end
}
