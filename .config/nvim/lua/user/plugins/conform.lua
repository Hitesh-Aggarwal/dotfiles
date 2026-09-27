require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
	},

	format_after_save = {
		-- These options will be passed to conform.format()
		lsp_format = "fallback",
	},
})
