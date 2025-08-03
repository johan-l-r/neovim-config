vim.pack.add({
	{ src = "https://github.com/lewis6991/gitsigns.nvim" }
})

local signs = require("gitsigns")
local km = vim.keymap

signs.setup({
	signs_staged_enable = true,
  numhl      					= true,
	signcolumn 					= true,
	attach_to_untracked = true, 

	on_attach = function()
		km.set("n", "<leader>nh", function()
			-- checks if vim is on diff mode
			if not vim.wo.diff then signs.nav_hunk("next") end
		end, { desc = "move to the next hunk" })

		km.set("n", "<leader>Nh", function()
			if not vim.wo.diff then signs.nav_hunk("prev") end
		end, { desc = "move to the next hunk" })

		km.set("n", "<leader>sh", signs.stage_hunk, { desc = "stage hunk under cursor" })
		km.set("n", "<leader>rh", signs.reset_hunk, { desc = "reset staged hunk under cursor" })
		km.set("n", "<leader>sb", signs.stage_buffer, { desc = "stage buffer" })
		km.set("n", "<leader>rb", signs.reset_buffer, { desc = "reset staged buffer" })
		km.set("n", "<leader>ph", signs.preview_hunk, { desc = "show line changes" })
		km.set("n", "<leader>dt", signs.diffthis, { desc = "show file changes" })
	end
})
