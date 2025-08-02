-- do not know if calling vim.pack.add in different files is ok
vim.pack.add({
	{ src = "https://github.com/neovim/nvim-lspconfig" }
})

vim.lsp.enable({
	-- list of desired LSPs
	"lua_ls", 
	"pyright"
})
