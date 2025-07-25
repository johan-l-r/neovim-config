local opt = vim.opt

-- number settings
opt.number 	       = true               -- show line number
opt.relativenumber = true	              -- show the line number relative to where the cursor is

-- aesthetics options
opt.cursorline 	   = true               -- highlights the line where the cursor is 
opt.termguicolors  = true               -- better colors 
opt.colorcolumn    = "100"              -- set the length marker
opt.numberwidth    = 4                  -- set the width of the number column 
opt.signcolumn     = "yes"

-- indentation set tings 
opt.autoindent     = true 		          -- copy the indentation level of the previous line
opt.smartindent    = true
opt.expandtab      = true
opt.tabstop        = 2                  -- 2 spaces for tabs (prettier default)
opt.shiftwidth     = 2                  -- 2 spaces for indent width


-- search settings  
opt.ignorecase     = true               -- ignore the case in the search patterns
opt.smartcase      = true               -- perform case sensitive search if search contains uppercase letters 

-- split settings  
opt.splitright     = true               -- create a vertical split to the right 
opt.splitbelow     = true               -- create a horizontal split at the bottom 

-- misc 
opt.foldclose      = "all"              -- closes fold if the cursor is not hovering it 
opt.foldopen       = "all"              -- opens the fold if the cursor is hovering it 
opt.showmode       = false              -- don't show the current mode
opt.swapfile       = false              -- no swap files
opt.backspace      = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position
opt.scrolloff      = 10
opt.sidescrolloff  = 10
opt.confirm        = true 		           -- asks to save changes before executing commands like :q or :e
