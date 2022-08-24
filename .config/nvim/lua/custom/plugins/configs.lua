local M = {}

M.nvimtree = {
	view = {
		side = "right",
	},
}

M.telescope = function()
	return {
		defaults = {
			mappings = {
				i = {
					["<ESC>"] = require("telescope.actions").close,
					["<C-j>"] = require("telescope.actions").move_selection_next,
					["<C-k>"] = require("telescope.actions").move_selection_previous,
				},
			},
		},
		extensions = {
			fzf = {
				fuzzy = true, -- false will only do exact matching
				override_generic_sorter = true, -- override the generic sorter
				override_file_sorter = true, -- override the file sorter
				case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			},
			file_browser = {
				-- disables netrw and use telescope-file-browser in its place
				hijack_netrw = true,
			},
		},
	}
end

M.cmp = function()
	local cmp = require("cmp")
	return {
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
	}
end

M.treesitter = {
	indent = {
		enable = true,
	},
	matchup = {
		enable = true,
	},
}

M.mason = {
	ensure_installed = {
		-- lua stuff
		"lua-language-server",
		"stylua",

		-- web dev
		"css-lsp",
		"html-lsp",
		"typescript-language-server",
		"emmet-ls",
		"json-lsp",
		"svelte-language-server",
		"prettier", -- formatter

		-- python
		"pyright",
		"black", -- formatter

		"rust-analyzer", --rust
		"marksman", -- markdown linter

		-- golang
		"gopls",
		"goimports", -- formatter

		"shfmt",
		"shellcheck",
	},
}

M.ui = {
	statusline = {
		separator_style = "block",
	},
	tabufline = {
		enabled = false,
	},
}

return M
