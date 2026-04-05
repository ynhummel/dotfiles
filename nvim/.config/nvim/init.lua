-- enable 24-bit True Color --
vim.opt.termguicolors = true

-- Editor configuration ---------------------------------------------------------------------------------------
vim.opt.nu = true              -- enable line numbers 
vim.opt.relativenumber = true  -- relative numbering
vim.opt.signcolumn = "yes:1"   -- separate 1px for sign column
vim.opt.wrap = false           -- line wrap
vim.opt.scrolloff = 8          -- 8 lines context at top and botton
vim.opt.swapfile = false       -- disable swap files
vim.opt.backup = false         -- disable backup files

-- Set colorscheme --
vim.cmd("colorscheme catppuccin")

-- Persistent undo (Unix and Windows compatible)
local home = os.getenv("HOME") or os.getenv("USERPROFILE") -- find home
local undodir = home .. "/.vim/undodir"                    -- set undodir
-- create directory if not exists
if vim.fn.isdirectory(undodir) == 0 then
    vim.fn.mkdir(undodir, "p")
end
vim.opt.undodir = undodir  -- set undo file path
vim.opt.undofile = true    -- enable undo file

-- vim.opt.clipboard = "unnamedplus"

-- Tab configuration --
vim.opt.tabstop = 4       -- columns occupied by \t
vim.opt.softtabstop = 4   -- columns moved by Tab or Backspace
vim.opt.shiftwidth = 4    -- spaces used when shifiting blocks
vim.opt.expandtab = true  -- hiting tabs insert space characters

-- Leader Key --
vim.g.mapleader = " "
-- --------------------------------------------------------------------------------------------------------

-- Remaps -------------------------------------------------------------------------------------------------
-- Buffer
vim.keymap.set("n", "<leader>bn", ":bn<CR>", {}) -- next buffer
vim.keymap.set("n", "<leader>bp", ":bp<CR>", {}) -- previous buffer
vim.keymap.set("n", "<leader>bk", ":bp<bar>sp<bar>bn<bar>bd<CR>", {}) -- kill buffer without closing window
-- System clipboard
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>p", '"+p')
vim.keymap.set("v", "<leader>p", '"+p')
-- Better scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- Move blocks of code up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- -------------------------------------------------------------------------------------------------------

