local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = {
  "jsonls",
  "html",
  "cssls",
  "emmet_ls",
  "gopls",
  "marksman",
  "pyright",
  "sumneko_lua",
  "tsserver",
  "svelte",
  "rust_analyzer",
  "marksman",
  "clangd",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

require("lspconfig").sumneko_lua.setup {
  -- ... other configs
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
}

vim.diagnostic.config {
  virtual_text = {
    prefix = " ", -- Could be '●', '▎', 'x'
  },
}
