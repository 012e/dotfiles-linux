local pluginConfs = require "custom.plugins.configs"

local M = {}

M.ui = {
  theme = "gruvbox",
}

M.plugins = {
  remove = {
    "folke/which-key.nvim",
    "NvChad/nvterm",
  },
  user = {
    ["tpope/vim-repeat"] = {},
    ["mbbill/undotree"] = {},
    ["mrjones2014/smart-splits.nvim"] = {},
    ["luukvbaal/stabilize.nvim"] = {
      config = function()
        require("stabilize").setup()
      end,
    },
    -- ["leoluz/nvim-dap-go"] = {
    --   ft = "go",
    --   after = "nvim-dap",
    --   config = function()
    --     require("dap-go").setup()
    --   end,
    -- },
    ["rcarriga/nvim-dap-ui"] = {
      requires = { "mfussenegger/nvim-dap" },
      after = "nvim-dap",
      config = function()
        require "custom.plugins.dap"
      end,
    },
    ["j-hui/fidget.nvim"] = {
      config = function()
        require("fidget").setup {}
      end,
    },
    ["nvim-telescope/telescope-fzf-native.nvim"] = {
      after = "telescope.nvim",
      run = "make",
      config = function()
        require("telescope").load_extension "fzf"
      end,
    },
    ["nvim-telescope/telescope-frecency.nvim"] = {
      after = "telescope.nvim",
      config = function()
        require("telescope").load_extension "frecency"
      end,
      requires = { "tami5/sqlite.lua" },
    },
    ["andymass/vim-matchup"] = {
      after = "nvim-treesitter",
    },
    ["jose-elias-alvarez/null-ls.nvim"] = {
      after = "nvim-lspconfig",
      config = function()
        require "custom.plugins.null-ls"
      end,
    },
    ["kylechui/nvim-surround"] = {
      events = { "BufRead", "BufNewFile" },
      config = function()
        require("nvim-surround").setup {}
      end,
    },
    ["neovim/nvim-lspconfig"] = {
      config = function()
        require "plugins.configs.lspconfig"
        require "custom.plugins.lspconfig"
      end,
    },
  },

  override = {
    ["kyazdani42/nvim-tree.lua"] = pluginConfs.nvimtree,
    ["NvChad/ui"] = pluginConfs.ui,
    ["nvim-telescope/telescope.nvim"] = pluginConfs.telescope,
    ["hrsh7th/nvim-cmp"] = pluginConfs.cmp,
    ["williamboman/mason"] = pluginConfs.mason,
    ["nvim-treesitter/nvim-treesitter"] = pluginConfs.treesitter,
    ["williamboman/mason.nvim"] = pluginConfs.mason,
  },
}

M.mappings = require "custom.mappings"

return M
