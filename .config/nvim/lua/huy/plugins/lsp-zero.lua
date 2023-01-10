return function()
	local my_lsp_servers = {
		"sumneko_lua",
		"gopls",
		'html',
		'cssls',
		'tsserver',
		"pyright"
	}
	local lsp = require('lsp-zero')
	lsp.preset('lsp-compe')
	lsp.nvim_workspace()
	lsp.set_preferences ({
		sign_icons = {}
	})

	-- Remap lsp keys {{{
	lsp.on_attach(function(client, bufnr)
		local map = function(mode, lhs, rhs)
			local opts = {remap = false, buffer = bufnr}
			vim.keymap.set(mode, lhs, rhs, opts)
		end
		map('n', '<F2>', '<cmd>lua require("renamer").rename()<cr>')
	end)
	-- }}}

	lsp.ensure_installed(my_lsp_servers)
	lsp.setup()

	-- Config cmp {{{
	local cmp = require('cmp')
	local cmp_config = lsp.defaults.cmp_config({
		mapping = cmp.mapping.preset.insert({
			["<C-k>"] = cmp.mapping.select_prev_item(),
			["<C-j>"] = cmp.mapping(function()
				if cmp.get_selected_entry() == nil then
					cmp.select_next_item()
					cmp.select_next_item()
				else
					cmp.select_next_item()
				end
			end),
			["<C-u>"] = cmp.mapping.scroll_docs(-4),
			["<C-d>"] = cmp.mapping.scroll_docs(4),
			["<C-Space>"] = cmp.mapping.complete(),
			["<C-e>"] = cmp.mapping.close(),
			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					})
				elseif require("luasnip").expand_or_jumpable() then
					require("luasnip").expand_or_jump()
				else
					fallback()
				end
			end),
		}),
	})
	cmp.setup(cmp_config)
	-- }}}


	vim.diagnostic.config({
		virtual_text = true,
		signs = false
	})
	vim.api.nvim_set_hl(0, 'DiagnosticUnderlineError', { underline = false, undercurl = true})

end
