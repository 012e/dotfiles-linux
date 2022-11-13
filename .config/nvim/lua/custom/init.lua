require("custom/myplugs/session-manager")
local when = vim.api.nvim_create_autocmd
local set = vim.opt

set.clipboard = "unnamed"

--[[
Default indent:
  - Use <space> instead of tabs
  - 2 space
]]
set.expandtab = true
set.tabstop = 2
set.shiftwidth = 2
set.softtabstop = 0
set.autoindent = true

-- ui related
set.cmdheight = 0
set.laststatus = 0
set.titlestring = "%t%m%r [%l/%L]"
-- set.winbar = "%F"
set.relativenumber = true
vim.cmd("set colorcolumn=80")

when("BufWinEnter", {
	pattern = "*",
	callback = function()
		set.laststatus = 0
	end,
})

-- Auto format
when("BufWritePre", {
	callback = function()
		if vim.inspect(vim.lsp.get_active_clients()) ~= "{}" then
			vim.lsp.buf.format()
		end
	end,
})

-- Auto close nvim tree
when("BufEnter", {
	nested = true,
	callback = function()
		if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
			vim.cmd("quit")
		end
	end,
})

-- Disable auto comment on new line
when("VimEnter", {
	callback = function()
		set.formatoptions = ""
	end,
})

-- Auto equalize panes
when("VimResized", {
	pattern = "*",
	command = [[exe "normal \<C-w>="]],
})

-- Custom user commands
vim.api.nvim_create_user_command("Vb", "normal! <C-v>", {}) -- Visual block mode
