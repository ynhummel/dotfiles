-- Disable netrw for nvimtree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes:1"

vim.opt.clipboard = 'unnamedplus'

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.scrolloff = 8

vim.g.mapleader = " "

-- Config lazy.vim package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

-- Nvim Tree
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- Buffer Remaps
vim.keymap.set("n", "<leader>bn", ":bn<CR>", {})                        -- next buffer
vim.keymap.set("n", "<leader>bp", ":bp<CR>", {})                        -- previous buffer
vim.keymap.set("n", "<leader>bd", ":bp<bar>sp<bar>bn<bar>bd<CR>", {})   -- kill buffer without closing window

-- Panes remap (work with tmux)
vim.keymap.set("n", "<C-w>h", "<C-w>s")

-- General Remaps
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "«leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>y", '"+Y')

-- Auto closing
-- vim.keymap.set("i", "(<space>", "()<C-c>i")
-- vim.keymap.set("i", "{<space>", "{}<C-c>i")
-- vim.keymap.set("i", "[<space>", "[]<C-c>i")
-- vim.keymap.set("i", "'<space>", "''<C-c>i")
-- vim.keymap.set("i", '"<space>', '""<C-c>i')
-- vim.keymap.set("i", "`<space>", "``<C-c>i")

-- Auto closing with lineBreak
-- vim.keymap.set("i", "(<CR>", "(<CR>)<C-c>O")
-- vim.keymap.set("i", "{<CR>", "{<CR>}<C-c>O")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.cmd("colorscheme onedark")
