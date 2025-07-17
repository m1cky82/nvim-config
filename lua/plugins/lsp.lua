return {
    "neovim/nvim-lspconfig",
    dependencies = {
	    "stevearc/conform.nvim",
	    "mason-org/mason.nvim",
	    "mason-org/mason-lspconfig.nvim",
	    "hrsh7th/cmp-nvim-lsp",
	    "hrsh7th/cmp-buffer",
	    "hrsh7th/cmp-path",
	    "hrsh7th/cmp-cmdline",
	    "hrsh7th/nvim-cmp",
	    "L3MON4D3/LuaSnip",
	    "saadparwaiz1/cmp_luasnip",
	    "j-hui/fidget.nvim",
    },

    config = function()
	    require("conform").setup({
		    formatters_by_ft = {
		    }
	    })
	    local cmp = require("cmp")
	    local cmp_lsp = require("cmp_nvim_lsp")
	    local capabilities = cmp_lsp.default_capabilities()

	    require("fidget").setup({})
	    require("mason").setup({})
	    require("mason-lspconfig").setup({
		    ensure_installed = {
			    "rust_analyzer",
			    "ts_ls",
			    "lua_ls",
		    },
	    })

	    local cmp_select = { behavior = cmp.SelectBehavior.Select }

	    cmp.setup({
		    snippet = {
			    expand = function(args)
				    require("luasnip").lsp_expand(args.body)
			    end,
		    },

		    window = {
		    },

		    mapping = cmp.mapping.preset.insert({
			    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
			    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
			    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
			    ["<C-Space>"] = cmp.mapping.confirm(),
		    }),

		    sources = cmp.config.sources({
			    { name = "nvim_lsp"},
			    { name = "luasnip" },
		    }, {
			    { name = "buffer" },
		    })
	    })

	    vim.diagnostic.config({
		    float = {
			    focusable = false,
			    style = "minimal",
			    border = "rounded",
			    source = "always",
			    header = "",
			    prefix = "",

		    },
	    })

    end
}
