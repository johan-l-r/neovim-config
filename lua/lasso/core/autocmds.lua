local user_config = vim.api.nvim_create_augroup("UserConfig", {})
local terminal_config = vim.api.nvim_create_augroup("UserConfig", {})

-- highlights the yanked text 
vim.api.nvim_create_autocmd("TextYankPost", {
  group = user_config, -- this is the "category" of this autocommand 

  callback = function() -- what the command will do 
    vim.highlight.on_yank() 
  end
})

vim.api.nvim_create_autocmd("TermClose", {
  group = user_config, -- this is the "category" of this autocommand 

  callback = function() -- what the command will do 
    if vim.v.event.status == 0 then 
      vim.api.nvim_buf_delete(0, {})
    end
  end
})

-- no numbers when using built-in termainl 
vim.api.nvim_create_autocmd("TermOpen", {
  group = terinal_config,  

  callback = function()  
    vim.opt.number = false
    vim.opt.relativenumber = false
  end
})

