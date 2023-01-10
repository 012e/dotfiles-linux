
-- utils {{{
local def_opts = { noremap = true, silent = true }

local function n(key, action)
	vim.keymap.set("n", key, action, def_opts)
end

local function i(key, action)
	vim.keymap.set("i", key, action, def_opts)
end

local function v(key, action)
	vim.keymap.set("v", key, action, def_opts)
end

local function nv(key, action)
	n(key, action)
	v(key, action)
end

local function any(key, action)
	n(key, action)
	i(key, action)
	v(key, action)
end

local function nl(key, action)
	n("<leader>"..key, action)
end

local function il(key, action)
	i("<leader>"..key, action)
end

local function vl(key, action)
	v("<leader>"..key, action)
end

local function anyl(key, action)
	any("<leader>"..key, action)
end

local function cmd(command)
	return "<cmd>"..command.."<cr>"
end

local function insert_cmd(command)
	return "<C-o>"..command
end

local function lua(command)
	return "lua "..command
end
-- }}}

-- miscs {{{
n("<ESC>", cmd "noh")
n("U", cmd "UndoTreeToggle")

-- save file
i("<C-Return>", insert_cmd "o")
i("<C-S-Return>", insert_cmd "O")
any("<C-s>", cmd "w")

-- move line up/down
v("J", ":m '>+1<CR>gv=gv")
v("K", ":m '<-2<CR>gv=gv")

-- buffer management
any("<C-l>", cmd "bnext")
any("<C-h>", cmd "bprevious")
any("<C-S-S>", function()
	require("harpoon.mark").add_file()
	print("added to harpoon "..vim.fn.expand('%'))
end)
any("H", cmd "Telescope harpoon marks")
-- }}}

-- movement {{{
nv("<M-k>", "<C-u>zz")
nv("<M-j>", "<C-d>zz")
nv("<M-C-K>", "<C-y>2kzz")
nv("<M-NL>", "<C-e>2jzz")
-- }}}

-- clipboard {{{
n("<C-c>", '"+yy<CMD>echo "copied line"<cr>')
i("<C-c>", '<ESC>"+yy<CMD>echo "copied line"<cr>a')
v("<C-c>", '"+y'.. cmd'echo "copied selection"<cr>')
nl("y", '"+yy')
-- }}}

-- indenting {{{
n("<Tab>", ">>")
n("<S-Tab>", "<<")
v("<Tab>", ">gv")
v("<S-Tab>", "<gv")
-- }}}

-- Lsp {{{
vim.keymap.set("n", "<F2>", cmd 'lua require("renamer").rename()', {remap = true})
-- }}}

-- Comment {{{
n("<C-_>", function() require("Comment.api").toggle.linewise.current() end)
i("<C-_>", function() require("Comment.api").toggle.linewise.current() end)
v("<C-_>", "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>")
-- }}}

-- Filesys tree {{{
any("<C-;>",   "<cmd>Neotree filesystem reveal right<cr>")
any("<C-S-:>", "<cmd>Neotree close<cr>")
-- }}}

-- Telescope {{{
local builtin = require("telescope.builtin")
nl("ff", builtin.find_files)
nl("fg", builtin.live_grep)
nl("fb", builtin.buffers)
n("<F5>", builtin.find_files)
n("<C-f>", builtin.live_grep)
-- }}}

-- Buffer movement {{{
n("<M-l>", cmd "SmartCursorMoveRight")
n("<M-h>", cmd "SmartCursorMoveLeft")
-- }}}

