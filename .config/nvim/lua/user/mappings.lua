-- Functional wrapper for mapping custom keybindings
local map = require("user.utils").map

-- Easy window switching
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Easy window resizing
map("n", "<C-Up>", ":vertical resize +2<CR>")
map("n", "<C-Down>", ":vertical resize -2<CR>")
map("n", "<C-Right>", ":resize +2<CR>")
map("n", "<C-Left>", ":resize -2<CR>")

-- Easy window moving
map("n", "<m-left>", "<C-w>H")
map("n", "<m-down>", "<C-w>J")
map("n", "<m-up>", "<C-w>K")
map("n", "<m-right>", "<C-w>L")

-- Move lines up and down with ALT-k and ALT-j
map("v", "<m-j>", ":m '>+1<CR>gv=gv")
map("v", "<m-k>", ":m '<-2<CR>gv=gv")
map("i", "<m-j>", "<esc>:m .+1<CR>==i")
map("i", "<m-k>", "<esc>:m .-2<CR>==i")
map("n", "<m-j>", ":m .+1<CR>==")
map("n", "<m-k>", ":m .-2<CR>==")

-- Copy and paste
map("x", "p", '"_dP')
map("n", "<leader>y", '"+y')
map("v", "<leader>y", '"+y')
map("n", "<leader>Y", '"+Y')
map("v", "<leader>Y", '"+Y')
map("n", "<leader>p", '"+p')
map("v", "<leader>p", '"+p')
map("n", "<leader>P", '"+P')
map("v", "<leader>P", '"+P')
