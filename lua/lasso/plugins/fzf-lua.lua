vim.pack.add({
	"https://github.com/ibhagwan/fzf-lua"
})

local fzf = require("fzf-lua")
local km = vim.keymap

fzf.setup({})

km.set("n", "<leader>ff", function() fzf.files() end, { desc = "show files in cwd" })
km.set("n", "<leader>fc", function() fzf.files({ cwd = "~/.confing/nvim" }) end, { desc = "show config files" })

