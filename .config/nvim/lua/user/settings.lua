local o = vim.o
local g = vim.g

o.number = true
o.relativenumber = true
o.lazyredraw = true
o.wrap = false
o.foldenable = false
o.foldmethod = "expr"
o.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.path:append("**")
o.confirm = true
o.ignorecase = true
o.smartcase = true
o.tabstop = 2
o.shiftwidth = 2
o.softtabstop = -1
o.expandtab = true
o.laststatus = 3
o.termguicolors = true
o.cursorline = true
o.undofile = true
o.backup = false
o.swapfile = false
o.scrolloff = 8
o.mouse = "a"
o.splitbelow = true
o.splitright = true
o.signcolumn = "yes"
o.hlsearch = false
o.colorcolumn = "80"

g.mapleader = " "
g.maplocalleader = " "
