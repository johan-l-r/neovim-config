-- here goes the custom keybinds
vim.g.mapleader = " " 
local km = vim.keymap

km.set({ "n", "v" }, "j", "jzz", { desc = "keep cursor in the center" })
km.set({ "n", "v" }, "k", "kzz", { desc = "keep cursor in the center" })

-- movement 
-- thanks ThePrimeAgen
km.set("v", "<C-j>", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })
km.set("v", "<C-k>", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" })

-- splits
km.set('n', '<C-h>', '<C-w><C-h>', { desc = 'move focus to the left window' })
km.set('n', '<C-l>', '<C-w><C-l>', { desc = 'move focus to the right window' })
km.set('n', '<C-j>', '<C-w><C-j>', { desc = 'move focus to the lower window' })
km.set('n', '<C-k>', '<C-w><C-k>', { desc = 'move focus to the upper window' })

km.set("n", "<leader>sn", "<cmd>vsplit<cr>", { desc = "create vertical split" })
km.set("n", "<leader>se", "<cmd>close<cr>", { desc = "close current split" })
