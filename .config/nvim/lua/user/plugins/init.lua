require("nvim-autopairs").setup()
require("fidget").setup()
require("todo-comments").setup()
require("trouble").setup()
require("ibl").setup()

require("colorizer").setup({
	"*",
	css = { css = true },
	html = { css = true },
	javascript = { css = true },
})
