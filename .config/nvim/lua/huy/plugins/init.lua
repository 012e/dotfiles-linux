local function myconf(plugin)
	return require("huy/plugins/"..plugin)
end

local function setup_theme(theme)
	return function()
		vim.cmd("colorscheme "..theme)
	end
end

local lazy_opts = {
	defaults = {
		lazy = true
	},
	performance = {
		cache = {
			enabled = true,
			-- disable_events = {},
		},
	}
}


-- Setup plugins {{{
require("lazy").setup({
	"andymass/vim-matchup",
	"numToStr/Comment.nvim",
	"tpope/vim-repeat",
	{ "ThePrimeagen/harpoon", dependencies = "nvim-lua/plenary.nvim",
		config = function()
			require("telescope").load_extension('harpoon')
		end
	},
	{"junegunn/vim-easy-align",          cmd = "EasyAlign" },
	{ "simrat39/symbols-outline.nvim",   config = {} },
	{ "luukvbaal/stabilize.nvim",        lazy = "VeryLazy", config = {} },
	{ "j-hui/fidget.nvim",               lazy = false, config = {} },
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = 'nvim-treesitter/nvim-treesitter-textobjects',
		config = myconf("treesitter")
	},
	{ "kylechui/nvim-surround",          event = "InsertEnter", config = {} },
	{ "windwp/nvim-autopairs",           event = "InsertEnter", config = myconf("autopairs") },
	{ "mbbill/undotree", cmd = "UndoTreeToggle" },
	{
		"mrjones2014/smart-splits.nvim",
		cmd = { "SmartCursorMoveRight", "SmartCursorMoveLeft" },
		config = { silent = true, tmux_integration = false }

	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		cmd = { "Neotree" },
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		config =  { close_if_last_window = true }
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" }

		},
		cmd = "Telescope",
		config = myconf("telescope")
	},
	{
		"kevinhwang91/nvim-hlslens",
		event = "VeryLazy",
		config = { nearest_only = true }
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		lazy = false,
		config = myconf("null-ls")
	},
	{
		'VonHeikemen/lsp-zero.nvim',
			dependencies = {
			-- LSP Support
			'neovim/nvim-lspconfig',
			'williamboman/mason.nvim',
			'williamboman/mason-lspconfig.nvim',

			-- Autocompletion
			'hrsh7th/nvim-cmp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'saadparwaiz1/cmp_luasnip',
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-nvim-lua',

			'L3MON4D3/LuaSnip',
			'rafamadriz/friendly-snippets',
		},
		lazy = false,
		config = myconf("lsp-zero")
	},
	{
		'filipdutescu/renamer.nvim',
		dependencies = { "nvim-lua/plenary.nvim" },
		config = {}
	},
	-- {{{ themes
	{
		"ellisonleao/gruvbox.nvim",
		-- enabled = false,
		priority = 100,
		lazy = false,
		config = function()
			vim.o.background = "dark" -- or "light" for light mode
			vim.cmd([[colorscheme gruvbox]])
		end
	},
	{
		"Shatur/neovim-ayu",
		enabled = false,
		priority = 100,
		lazy = false,
		config = setup_theme "ayu"
	},
	{
		"folke/tokyonight.nvim",
		enabled = false,
		priority = 100,
		lazy = false,
		config = setup_theme "tokyonight-storm"
	}
	-- }}}
}, lazy_opts)
-- }}}

require("git-session")
