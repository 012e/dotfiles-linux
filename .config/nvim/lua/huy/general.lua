local set      = vim.opt
local global   = vim.g

global.mapleader = " " -- leader key

global.loaded_netrw = 0
global.loaded_netrwPlugin = 0

-- spelling
set.spell = false
set.spelllang = { 'en_us' }

-- styling
require("styling/default")

-- UI {{{
set.termguicolors = true
set.laststatus = 0
set.cmdheight = 1
set.title = true
set.titlestring = "%t%m%r [%l/%L]"
set.colorcolumn = "80"
-- set.signcolumn = 'yes'
vim.cmd[[set shm+=I]] -- no welcome screen
-- }}}

-- misc {{{
set.smartcase = true
set.ignorecase = true
set.foldmethod = "marker"
set.list = false
vim.opt.listchars = { tab = '❯ ', eol = '↲' , trail = '-' }

-- }}}

-- undo {{{
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
-- }}}

-- vim.cmd {{{
vim.cmd("autocmd BufEnter * set formatoptions-=cro") -- disable auto comment
-- }}}
