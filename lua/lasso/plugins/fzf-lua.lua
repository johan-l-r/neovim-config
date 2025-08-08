vim.pack.add({
	"https://github.com/ibhagwan/fzf-lua"
})

local fzf = require("fzf-lua")
local km = vim.keymap

fzf.setup({})

km.set("n", "<leader>ff", ":FzfLua files<cr>", { desc = "show files in cwd" })
km.set("n", "<leader>fc", ":FzfLua files cwd=~/.config/nvim/<cr>", { desc = "show files in cwd" })

