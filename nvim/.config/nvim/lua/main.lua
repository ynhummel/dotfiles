vim.g.mapleader = " "

-- Vim Options
local opt = vim.opt

-- Editor
opt.termguicolors = true
opt.nu = true
opt.relativenumber = true
opt.signcolumn = "yes:1" -- 1px for sign column

opt.wrap = false
opt.scrolloff = 8
opt.splitright = true
opt.splitbelow = true

-- set colorscheme
vim.cmd('colorscheme default')

-- Tab Options
opt.tabstop = 8      -- \t size
opt.softtabstop = 4  -- <Tab> and <BS> keys size
opt.shiftwidth = 4   -- indentation width
opt.expandtab = true -- spaces instead of tabs

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
require("treesitter")

-- Mini Stuff
require('mini.pick').setup({})
-- require('mini.files').setup({})
require('mini.pairs').setup({})
require('mini.completion').setup({})
-- require('mini.snippets').setup({})
require('mini.icons').setup({
  style = 'ascii'
})

