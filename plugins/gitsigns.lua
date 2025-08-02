vim.pack.add({
	{ src = "https://github.com/lewis6991/gitsigns.nvim" }
})

local signs = require("gitsigns")

signs.setup({
	signs_staged_enable = true,
  numhl      					= true,
	signcolumn 					= true, 

	vim.keymap.set("n", "<leader>ll", function()
		if vim.wo.diff then -- checks if window is in vim's diff mode
			vim.cmd.normal({']c', bang = true})
		else
			signs.nav_hunk('next')
		end
	end)
})
