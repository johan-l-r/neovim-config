vim.api.nvim_create_autocmd("BufWritePre", { -- execute this command when file is saved
	pattern = "*", -- apply to all files

	callback = function()
		local cursor_pos = vim.api.nvim_win_get_cursor(0)

		vim.cmd([[keeppatterns %s/\s\+$//e]])
		vim.api.nvim_win_set_cursor(0, cursor_pos)
	end,
})
