vim.g.mapleader = " "

require("lasso.plugins.kanagawa")
require("lasso.plugins.fzf-lua")
require("lasso.plugins.lsp")
require("lasso.plugins.gitsigns")
require("lasso.plugins.treesitter")
require("lasso.core.autocmds")

local o = vim.opt
local km = vim.keymap

-- OPTIONS
o.number 				 = true
o.relativenumber = true
o.ignorecase 		 = true
o.smartcase 	 	 = true
o.splitright 		 = true
o.splitbelow 		 = true
o.swapfile 			 = false -- no swap files
o.shiftwidth		 = 2 		 -- indentation is equal to 2 spaces
o.tabstop				 = 2
o.signcolumn		 = "yes" -- I like the little gap in the number column
o.colorcolumn 	 = "100" -- show a mark for line length

-- KEYMAPS
km.set("n", "<leader>bn", ":bnext<cr>", { desc = "goto next buffer" })
km.set("n", "<leader>bp", ":nprevious<cr>", { desc = "goto prev buffer" })

km.set("n", "<leader>W", ":wa<cr>", { desc = "write all" })
km.set("n", "<leader>Q", ":qa<cr>", { desc = "quit all" })
km.set("n", "<leader>w", ":w<cr>", { desc = "write" })
km.set("n", "<leader>q", ":q<cr>", { desc = "quit" })
km.set("n", "<leader>R", ":restart<cr>", { desc = "restart" })

km.set({ "n", "x" }, "G", "Gzz", { desc = "goto bottom of file and center the cursor" })
km.set({ "n", "x" }, "j", "jzz", { desc = "move down and center the cursor" })
km.set({ "n", "x" }, "k", "kzz", { desc = "move up and center the cursor" })
km.set("n", "<C-u>", "<C-u>zz", { desc = "move half the file up and center the cursor" })
km.set("n", "<C-d>", "<C-d>zz", { desc = "move half the file down and center the cursor" })
km.set("n", "<leader>rc", ":e ~/.config/nvim/init.lua<cr>", { desc = "goto config" })
km.set("n", "<leader>vs", ":vsplit<cr>", { desc = "open new vertical split" })
km.set("n", "<leader>hs", ":split<cr>", { desc = "open new horizontal split" })
km.set("n", "<leader>yl", "\"+yy", { desc = "yank line to clipboard" })
km.set("n", "<leader>yf", "ggVG\"+y", { desc = "yank file to clipboard" })
