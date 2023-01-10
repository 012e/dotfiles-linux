return function()
	local null_ls = require("null-ls")

	local sources = {
		null_ls.builtins.formatting.goimports, -- go
		null_ls.builtins.formatting.prettierd, -- the web
		null_ls.builtins.formatting.black, -- python
		null_ls.builtins.formatting.shfmt, -- shell
		null_ls.builtins.formatting.rustfmt, -- rust
	}

	-- format on save
	local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
	null_ls.setup({
		debug = true,
		sources = sources,
		on_attach = function(client, bufnr)
			if client.supports_method("textDocument/formatting") then
				vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = augroup,
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.format({ bufnr = bufnr })
					end,
				})
			end
		end,
	})

end
