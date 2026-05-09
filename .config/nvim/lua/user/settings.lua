local o = vim.o
local g = vim.g

o.number = true
o.relativenumber = true
o.lazyredraw = true
o.wrap = false
vim.opt.path:append("**")
o.confirm = true
o.ignorecase = true
o.smartcase = true
o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = -1
o.expandtab = false
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
o.colorcolumn = "80,120"

g.mapleader = " "
g.maplocalleader = " "
