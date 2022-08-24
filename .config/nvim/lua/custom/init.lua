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
set.cmdheight = 1

set.relativenumber = true
vim.cmd("set colorcolumn=80")

-- Auto format
when("BufWritePre", {
	callback = function()
		vim.lsp.buf.format()
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
