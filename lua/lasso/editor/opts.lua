-- here goes the editor settings 
local opt = vim.opt

-- aesthetics 
opt.number = true              -- Show line numbers
opt.cursorline = true          -- Highlight the current line
opt.termguicolors = true       -- Enable true color support
opt.relativenumber = true      -- Show relative line numbers

-- indentation behavior
opt.tabstop = 2                -- Number of spaces that a <Tab> in the file counts for
opt.shiftwidth = 2             -- Number of spaces to use for each level of indentation
opt.autoindent = true          -- Copy indentation from the current line when starting a new one

-- editor behavior
opt.splitright = true          -- Vertical splits open to the right
opt.clipboard  = "unnamedplus" -- Use the system clipboard for copy/paste
