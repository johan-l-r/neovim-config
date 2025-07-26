return {
  "m4xshen/autoclose.nvim", 

  event = "InsertEnter", 

  config = function() 
    require("autoclose").setup({
      keys = {
        ["<"] = { escape = false, close = true, pair = "<>" }
      },
      options = {
        auto_indent = true, 
        disable_command_mode = true
      }
    })
  end
}
