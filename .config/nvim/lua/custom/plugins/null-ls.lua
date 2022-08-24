local present, null_ls = pcall(require, "null-ls")

if not present then
	return
end

local sources = {
	null_ls.builtins.formatting.goimports, -- go
	null_ls.builtins.formatting.prettier, -- the web
	null_ls.builtins.formatting.stylua, -- lua
	null_ls.builtins.formatting.black, -- python
	null_ls.builtins.formatting.shfmt, -- shell
	null_ls.builtins.formatting.rustfmt, -- rust
	null_ls.builtins.code_actions.shellcheck,
	-- null_ls.builtins.formatting.mix,
}

null_ls.setup({
	debug = true,
	sources = sources,
})
