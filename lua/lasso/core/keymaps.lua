vim.g.mapleader = " "

local kb = vim.keymap

-- code visualization
kb.set("n", "n", "nzzzv", { desc = "go to next search match (centered)" })
kb.set("n", "N", "Nzzzv", { desc = "go to previous search match (centered)" })
kb.set("n", "<C-u>", "<c-u>zz", { desc = "go half page up (centered)" })
kb.set("n", "<C-d>", "<c-d>zz", { desc = "go half page up (centered)" })

-- buffer motions
kb.set("n", "<leader>bn", "<cmd>bnext<cr>", { desc = "go to next buffer" })
kb.set("n", "<leader>bp", "<cmd>bprevious<cr>", { desc = "go to previous buffer" })

-- splits management
kb.set("n", "<leader>sv", "<cmd>vsplit<cr>", { desc = "open vertical split" })
kb.set("n", "<leader>sh", "<cmd>split<cr>", { desc = "open horizontal split" })
kb.set("n", "<C-Up>", "<cmd>resize -2<cr>", { desc = "decrease window height" })
kb.set("n", "<C-Down>", "<cmd>resize +2<cr>", { desc = "increase window height" })
kb.set("n", "<C-Left>", "<cmd>vertical resize +2<cr>", { desc = "increase window width" })
kb.set("n", "<C-Right>", "<cmd>vertical resize -2<cr>", { desc = "decrease window height" })

-- split navigation
kb.set("n", "<C-h>", "<C-w>h", { desc = "move to right split" })
kb.set("n", "<C-k>", "<C-w>k", { desc = "move to top split" })
kb.set("n", "<C-j>", "<C-w>j", { desc = "move to bottom split" })
kb.set("n", "<C-l>", "<C-w>l", { desc = "move to left split" })

-- lines motions
kb.set("n", "<A-j>", ":m .+1<CR>==", { desc = "move line down" })
kb.set("n", "<A-k>", ":m .-2<CR>==", { desc = "move line up" })
kb.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "move selection down" })
kb.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "move selection up" })

-- misc
kb.set("n", "<leader>e", ":Explore<CR>", { desc = "open file explorer" })
kb.set("n", "<leader>ff", ":find ", { desc = "find file" })
kb.set("n", "<leader>rc", ":e ~/.config/nvim/init.lua<CR>", { desc = "Edit config" })
kb.set("n", "<leader>nf", function()
  file_name = vim.fn.input("enter file name: ")
  
  if file_name ~= "" then 
    vim.cmd("e %:p:h/" .. file_name)
  end
end, { desc = "create new file" })   
