return {
  "nvim-treesitter/nvim-treesitter",

  event = { "BufReadPre", "BufNewFile" },

  build = ":TSUpdate",

  config = function()
    require("nvim-treesitter.configs").setup({ 
      highlight = {
        enable = true,
      },
      indent = { enable = true },
      ensure_installed = {
        "json",
        "javascript",
        "typescript",
        "html",
        "css",
        "markdown",
        "bash",
        "lua",
        "gitignore",
        "c"
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>"
        }
      }
    })

    vim.treesitter.language.register("bash", "zsh")
  end
}
