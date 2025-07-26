return {
  "ramojus/mellifluous.nvim",

  config = function()
    require("mellifluous").setup({}) -- optional, see configuration section.
    vim.cmd("colorscheme mellifluous")
  end,
}
