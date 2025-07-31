vim.g.mapleader = " "

local o = vim.opt
local km = vim.keymap

-- oions
o.number = true
o.relativenumber = true -- show relative number
o.swapfile = false -- no swap files 
o.shiftwidth = 2
o.tabstop = 2

-- keymaps 
km.set("n", "<leader>so", "<cmd>so<cr>", { desc = "source config" })
km.set("n", "<leader>oe", "<cmd>:Explore<cr>", { desc = "source config" })
