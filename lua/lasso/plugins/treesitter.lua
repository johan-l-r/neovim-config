vim.pack.add({
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		version = "master",
	},
	{ src = "https://github.com/Wansmer/treesj" }
})

-- for syntax highlight and incremental selection
require("nvim-treesitter.configs").setup({
	-- add here any language parser you need
	ensure_installed = {
		"lua",
		"python",
		"javascript",
		"c",
		"html",
		"css"
	}, 
	highlight = {
		enable = true
	}, 
	incremental_selection = {
    enable = true,
    keymaps = {
			init_selection = "<C-space>",
			node_incremental = "<C-space>",
			scope_incremental = false,
			node_decremental = "<bs>",
		},
  }
})

-- for splitting/joining blocks of code like arrays
require('treesj').setup({
	cursor_behavior = "end"
})
