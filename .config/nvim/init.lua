require("user.settings")
require("user.autocommands")
require("user.mappings")

vim.pack.add({
	{ src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
	"https://github.com/windwp/nvim-autopairs",
	"https://github.com/numToStr/Comment.nvim",
	"https://github.com/lewis6991/gitsigns.nvim",
	"https://github.com/j-hui/fidget.nvim",
	"https://github.com/folke/todo-comments.nvim",
	"https://github.com/folke/trouble.nvim",
	"https://github.com/jghauser/mkdir.nvim",
	"https://github.com/lukas-reineke/indent-blankline.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/Bekaboo/dropbar.nvim",
	"https://github.com/catgoose/nvim-colorizer.lua",
	"https://github.com/mbbill/undotree",
	"https://github.com/stevearc/conform.nvim",
	"https://github.com/ibhagwan/fzf-lua",
	"https://github.com/nvim-lualine/lualine.nvim",
	"https://github.com/hrsh7th/nvim-cmp",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/hrsh7th/cmp-nvim-lsp",
	"https://github.com/hrsh7th/cmp-vsnip",
	"https://github.com/hrsh7th/vim-vsnip",
	"https://github.com/hrsh7th/cmp-buffer",
	"https://github.com/hrsh7th/cmp-path",
	"https://github.com/hrsh7th/cmp-nvim-lsp-signature-help",
	"https://github.com/rafamadriz/friendly-snippets",
	"https://github.com/onsails/lspkind.nvim",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/williamboman/mason.nvim",
})

require("user.plugins")
require("user.plugins.conform")
require("user.plugins.fzf_lua")
require("user.plugins.lualine")
require("user.plugins.cmp")
require("user.plugins.lsp")
require("user.plugins.undotree")

vim.cmd.colorscheme("catppuccin-mocha")
