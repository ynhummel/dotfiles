vim.g.mapleader = " "

-- Vim Options
local opt = vim.opt

-- Editor
opt.termguicolors = true
opt.nu = true
opt.relativenumber = true
opt.signcolumn = "yes:1" -- separate 1px for sign column

opt.wrap = false
opt.scrolloff = 8
opt.splitright = true
opt.splitbelow = true

-- Tab Options
opt.tabstop = 8      -- Visual \t width
opt.softtabstop = 4  -- <Tab> and <BS> keys space inserted 
opt.shiftwidth = 4   -- auto-indentation width
opt.expandtab = true -- insert space characters instead of tabs

-- Swap and backup
opt.swapfile = false
opt.backup = false

-- Persistent undo
local home = os.getenv("HOME") or os.getenv("USERPROFILE")
local undodir = home .. "/.vim/undodir"

if vim.fn.isdirectory(undodir) == 0 then
    vim.fn.mkdir(undodir, "p")
end

opt.undodir = undodir
opt.undofile = true

-- Custom modules
require("keys")
require("lsp")

-- Mini Stuff
require('mini.pairs').setup({})
require('mini.completion').setup({})
