vim.pack.add({
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		version = "master",
	},
	{ src = "https://github.com/Wansmer/treesj" }, 
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects" }
})

local ts_repeat = require("nvim-treesitter.textobjects.repeatable_move")

-- for syntax highlight, incremental selection and text objects 
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
			init_selection 		= "<C-space>",
			node_incremental  = "<C-space>",
			scope_incremental = false,
			node_decremental  = "<bs>",
		}
  }, 
	textobjects = {
		select = {
			enable 		= true, 
			lookahead = true, 

			keymaps = {
				["aa"] = "@assignment.outer", 
				["ia"] = "@assignment.inner", 
				["ra"] = "@assignment.rhs", 
				["la"] = "@assignment.lhs", 
				["af"] = "@function.outer",
				["if"] = "@function.inner"
			}
		}, 
		move = {
			enable = true, 
			goto_next_start = {
				["[f"] = "@function.outer",
				["[ra"] = "@assignment.rhs", 
				["[la"] = "@assignment.lhs", 
				["[b"] = "@block.outer", 
				["[c"] = "@conditional.inner", 
			}, 
			goto_previous_start = {
				["]f"] = "@function.outer",
				["]ra"] = "@assignment.rhs", 
				["]la"] = "@assignment.lhs", 
				["]b"] = "@block.outer", 
				["]c"] = "@conditional.inner", 
			}
		}
	}	
})

-- for splitting/joining blocks of code like arrays
require('treesj').setup({
	cursor_behavior = "end"
})

vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat.repeat_last_move)
vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat.repeat_last_move_opposite)
