local opt = vim.opt

-- editor settings
opt.number 	       = true -- show line number
opt.relativenumber = true	-- show the line number relative to where the cursor is
opt.cursorline 	   = true -- highlights the line where the cursor is 
opt.colorcolumn    = "80" -- set the length marker
opt.numberwidth    = 5    -- set the width of the number column 

-- behavior options
opt.autoindent = true 		          -- copy the indentation level of the previous line
opt.confirm    = true 		          -- asks to save changes before executing commands like :q or :e
opt.expandtab  = true
opt.ignorecase = true               -- ignores the case in the search patterns
opt.smartcase  = true
opt.tabstop    = 2                  -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2                  -- 2 spaces for indent width
opt.backspace  = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position
opt.swapfile   = false
opt.splitright = true

-- misc 
opt.foldclose = "all"  -- closes fold if the cursor is not hovering it 
opt.foldopen = "all"   -- opens the fold if the cursor is hovering it 
