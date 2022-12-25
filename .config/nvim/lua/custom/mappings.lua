local M = {}

local function smartdd()
	local current_line = vim.api.nvim_get_current_line()
	if current_line == "" or current_line:sub(-1) == "	" or vim.api.nvim_get_current_line():match("^%s*$") then
		vim.cmd([[execute "normal! \"_dd"]])
	else
		vim.cmd([[execute "normal! dd"]])
	end
end

local function debug_test()
	if vim.bo.filetype == "go" then
		require("dap-go").debug_test()
	end
end

local function l(mapping)
	return "<leader>" .. mapping
end

M.disabled = {
	n = {
		["<S-b>"] = "",
	},
	i = {
		["<C-j>"] = "",
		["<C-k>"] = "",
	},
}

M.nvimtree = {
	i = {
		["<C-;>"] = { "<cmd> NvimTreeFocus <cr><ESC>", "open tree" },
		["<C-S-:>"] = { "<cmd> NvimTreeClose <cr>", "close tree" },
	},
	n = {
		["<C-;>"] = { "<cmd> NvimTreeFocus <cr>", "open tree" },
		["<C-S-:>"] = { "<cmd> NvimTreeClose <cr>", "close tree" },
	},
	v = {
		["<C-;>"] = { "<cmd> NvimTreeFocus <cr>", "open tree" },
		["<C-S-:>"] = { "<cmd> NvimTreeClose <cr>", "close tree" },
	},
}

M.telescope = {
	n = {
		[l("fr")] = {
			"<cmd> Telescope frecency <cr>",
			"open list of recently used file",
		},
		[l("fg")] = { "<cmd> Telescope live_grep <cr>", "live grep" },
		["<F5>"] = { "<cmd> Telescope find_files <cr>", "find files" },
		[l("fg")] = { "<cmd> Telescope live_grep <cr>", "live grep" },
		["?"] = { "<cmd> Telescope diagnostics <cr>", "code diagnostic" },
		[l("fs")] = {
			"<cmd> Telescope lsp_document_symbols<cr>",
			"find document symbols",
		},
	},
	i = {
		["<F5>"] = { "<cmd> Telescope find_files <cr>", "find files" },
		["<C-f>"] = { "<cmd> Telescope live_grep <cr>", "live grep" },
	},
	v = {
		["<F5>"] = { "<cmd> Telescope find_files <cr>", "find files" },
		["<C-f>"] = { "<cmd> Telescope live_grep <cr>", "live grep" },
	},
}

M.comment = {
	n = {
		["<C-_>"] = {
			function()
				require("Comment.api").toggle.linewise.current()
			end,

			"蘒  toggle comment",
		},
	},
	i = {
		["<C-_>"] = {
			function()
				require("Comment.api").toggle.linewise.current()
			end,

			"toggle comment",
		},
	},

	v = {
		["<C-_>"] = {
			"<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
			"toggle comment",
		},
	},
}

M.clipboard = {
	n = {
		["<C-c>"] = { [["+yy<CMD>echo "copied line"<cr>]], "copy line" },
		-- ["<C-v>"] = { '"+p', "paste" },
	},
	i = {
		["<C-c>"] = { [[<ESC>"+yy<CMD>echo "copied line"<cr>a]], "copy line" },
		-- ["<C-v>"] = { '<ESC>"+pa', "paste" },
	},
	v = {
		["<C-c>"] = { '"+y', "copy selection" },
	},
}

M.buffers = {
	n = {
		["<C-h>"] = { "<cmd>bp<cr>", "previous buffer" },
		["<C-l>"] = { "<cmd>bn<cr>", "next buffer " },
	},
}

M.pane = {
	n = {
		["<M-h>"] = {
			"<cmd>SmartCursorMoveLeft<cr>",
			"move to next pane on right",
		},
		["<M-l>"] = {
			"<cmd>SmartCursorMoveRight<cr>",
			"move to next pane on the left",
		},
		["<M-k>"] = {
			"<cmd>SmartCursorMoveUp<cr>",
			"move cursor up (pane)",
		},
		["<M-j>"] = {
			"<cmd>SmartCursorMoveDown<cr>",
			"move cursor down (pane)",
		},
		-- ["<C-k>"] = { "<C-w>k", "move to next pane on right" },
		["<M-C-H>"] = { "<cmd>SmartResizeLeft 5<cr>", "" },
		["<M-C-L>"] = { "<cmd>SmartResizeRight 5<cr>", "" },
	},
}

M.lsp = {
	n = {
		["<F2>"] = {
			'<cmd>lua require("nvchad_ui.renamer").open() <cr>',
			"rename variable",
		},
		['<C-S-">'] = {
			function()
				vim.diagnostic.goto_next()
				vim.diagnostic.open_float()
			end,
			"go to next diagnostic",
		},
		["<C-'>"] = {
			function()
				vim.diagnostic.goto_prev()
				vim.diagnostic.open_float()
			end,
			"go to previous diagnostic",
		},
	},
	i = {
		["<F2>"] = {
			'<cmd>lua require("nvchad_ui.renamer").open() <cr>',
			"rename variable",
		},
		['<C-S-">'] = {
			function()
				vim.diagnostic.goto_next()
				vim.diagnostic.open_float()
			end,
			"go to next diagnostic",
		},
		["<C-'>"] = {
			function()
				vim.diagnostic.goto_prev()
				vim.diagnostic.open_float()
			end,
			"go to previous diagnostic",
		},
	},
}

M.indent_with_tabs = {
	n = {
		["<tab>"] = {
			">>",
			"",
		},
		["<S-Tab>"] = {
			"<<",
			"",
		},
	},
	v = {
		["<tab>"] = {
			">gv",
			"",
		},
		["<S-Tab>"] = {
			"<gv",
			"",
		},
	},
}

M.l = {
	n = {
		[l("ld")] = {
			function()
				vim.lsp.buf.definition()
			end,
			"go to definition",
		},
		["<C-f>"] = {
			function()
				vim.diagnostic.open_float()
			end,
			"float windows diagnostic",
		},
		[l("lc")] = {
			function()
				vim.lsp.buf.code_action()
			end,
			"select code actions",
		},
		[l("lr")] = {
			function()
				vim.lsp.buf.references()
			end,
			"go to references",
		},
		[l("li")] = {
			function()
				vim.lsp.buf.implementation()
			end,
			"show implementations",
		},
		[l("ll")] = { "<cmd> SymbolsOutline <cr>", "" },
	},
}

M.dap = {
	n = {
		["<F9>"] = {
			"<cmd> lua require'dap'.toggle_breakpoint()<cr>",
			"toggle break point",
		},
		["<F33>"] = {
			"<cmd> lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
			"C-F9 toggle break point (with condition)",
		},
		["<F21>"] = {
			"<cmd> lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>",
			"S-F9 break point (with message)",
		},
		["<F12>"] = {
			"<cmd> lua require'dap'.continue()<cr>",
			"start debugger or just continue debugging",
		},
		["<F11>"] = { "<cmd> lua require'dap'.step_over()<cr>", "step over" },
		["<F35>"] = { "<cmd> lua require'dap'.step_out()<cr>", "C-F11step out" },
		["<F23>"] = {
			"<cmd> lua require'dap'.step_into()<cr>",
			"S-F11 step into",
		},
		[l("dt")] = { debug_test, "debug test" },
		["<Home>"] = {
			function()
				require("dapui").toggle(1)
			end,
			"toggle side bar of dapui",
		},
		["<End>"] = {
			function()
				require("dapui").toggle(2)
			end,
			"toggle dapui stdout and dap's repl",
		},
		["<C-q>"] = {
			"<cmd>lua require('dap').terminate({}, {}, function() end)<cr>",
			"terminate debugger",
		},
	},
}

M.insert_editing = {
	i = {
		["<M-[>"] = { [[{
}<ESC>O]], "new bracket new line" },
		["<M-p>"] = { "<C-r>*", "paste" },
	},
}

M.general = {
	n = {
		["<C-s>"] = { "<cmd>w<cr>", "save file" },
		["<A-v>"] = { "<cmd> Vb <cr>", "visual block mode" },
		["<C-u>"] = { "<C-u>zz", "" },
		["<C-d>"] = { "<C-d>zz", "" },
		["U"] = { "<cmd> UndotreeToggle<cr>", "" },
		["dd"] = { smartdd, "" },
		["<F29>"] = {
			function()
				vim.opt.clipboard = "unnamedplus"
				vim.opt.winbar = "global clipboard"
				vim.defer_fn(function()
					vim.opt.clipboard = "unnamed"
					vim.opt.winbar = ""
				end, 5000)
			end,
			"enable global clipboard for 5s",
		},
	},
	i = {
		["<C-s>"] = { "<cmd> w <cr>", "save file" },
		["<C-Return>"] = { "<ESC>o", "new line" },
		["<C-S-Return>"] = { "<ESC>O", "new line above" },
		["<C-b>"] = { "<C-o>^", "move to begin of line" },
		["<C-e>"] = { "<C-o>$", "move to end of line" },
	},
	v = {
		["<C-s>"] = { "<cmd> write <cr>.", "save file" },
	},
}

return M
