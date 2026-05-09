return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				-- tex = { "tex-fmt" },
				-- bib = { "bibtex-tidy" },
				-- python = { "black" },
				-- javascript = { "prettierd" },
				-- html = { "prettierd" },
				-- css = { "prettierd" },
				-- json = { "prettierd" },
				-- yaml = { "prettierd" },
			},

			format_on_save = {
				-- These options will be passed to conform.format()
				timeout_ms = 2000,
				lsp_fallback = true,
			},
		})
	end,
}
