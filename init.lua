vim.g.mapleader = " "

local o = vim.opt
local km = vim.keymap

-- oions
o.number = true
o.relativenumber = true -- show relative number
o.swapfile = false -- no swap files 
o.shiftwidth = 2 -- indentation is equal to 2 spaces 
o.tabstop = 2
o.signcolumn = "yes" -- I like the little gap in the number column 
o.colorcolumn = "100" -- show a mark for line length

-- neovim keymaps 
km.set("n", "<leader>so", function() 
	vim.cmd("write") 
	vim.cmd("so %")

	vim.api.nvim_echo( {{"config sourced! \n" }}, false, {}) -- prints when config is sourced
end, { desc = "source config" })

km.set("n", "<leader>oe", ":Explore<cr>", { desc = "open netrw" })

-- plugins! (with vim.pack)
vim.pack.add({
	{ src = "https://github.com/thesimonho/kanagawa-paper.nvim" }
})

vim.cmd("colorscheme kanagawa-paper")


