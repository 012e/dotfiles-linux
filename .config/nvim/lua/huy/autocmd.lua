local autocmd = vim.api.nvim_create_autocmd
local huy_autocmd = vim.api.nvim_create_augroup("huy_autocmd", { clear = true })

-- highlight yanked text
autocmd("TextYankPost", {
	group = huy_autocmd,
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = 300 })
	end,
})


