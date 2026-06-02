-- Remaps
local keymap = vim.keymap.set

-- Buffer
keymap("n", "<leader>bn", ":bn<CR>", {}) -- next buffer
keymap("n", "<leader>bp", ":bp<CR>", {}) -- previous buffer
keymap("n", "<leader>bk", ":bp<bar>sp<bar>bn<bar>bd<CR>", {}) -- kill buffer without closing window

-- System clipboard
keymap("n", "<leader>y", '"+y')
keymap("v", "<leader>y", '"+y')
keymap("n", "<leader>p", '"+p')
keymap("v", "<leader>p", '"+p')

-- Better scrolling
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")

-- Move blocks of code up and down
keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")

