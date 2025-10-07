return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "eslint", stop_after_first = true },
				typescript = { "eslint", stop_after_first = true },
				vue = { "eslint", "biome", stop_after_first = true },
				rust = { "rustfmt" },
			},
			format_on_save = {
				lsp_format = "fallback",
			},
		},
	},
}
