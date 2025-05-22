# Neovim config
Hello! This repo will be used to store my neovim configuration and hopefully to serve as a guide for someone who wants to start using this awesome editor but does not know where to start. 

Feel free to clone this repo and use my config as you please, but remember that the best way to learn is by doing :) 

## Why to use neovim ❓
If you feel comfortable with your current IDE/text editor then there is no reason to switch. Just use the tool that makes you enjoy more your job, but if you are as curious as me then here are some good reasons to switch: 
- Vim keybinds are really good when you get used to them
- It is less bloated than other editors 
- You have control over most of the things 

## Why not to use neovim ❓
Let's face it, if you really want to have a good development experience with this editor **you'll have to put some work**. I'm not saying that customizing neovim is like installing Arch manually, but if you want an editor with the features we all love like autocompletion, linting or syntax highlight right uot of the box then you should use VScode instead.

## What about the neovim distros ❓
A Neovim distro is a pre-configured Neovim setup that comes with plugins, keybindings, and features already in place. They’re a great way to explore **what Neovim can do when customized properly**. That said, I personally don’t use them because part of the appeal of Neovim for me is building my own setup from the ground up, with my own keybindings, themes, and only the tools that truly fit my workflow.

Here you have some of the most popular distros in case you want to check'em out: 
- [AstroNvim](https://astronvim.com/)
- [LazyVim](https://www.lazyvim.org/)
- [NVChad](https://nvchad.com/)

## `.config` 
### File structure
These directories are inside `.config/nvim/`: 
```
.
├── init.lua
├── lua
│   └── lasso
│       ├── editor
│       │   ├── init.lua
│       │   ├── keybinds.lua
│       │   └── opts.lua
│       ├── lazy.lua
│       └── plugins

```

### `init.lua`
Int his file we'll `require` two other files: 
- `lasso.editor.init`
- `lasso.lazy`

```
--- editor settings 
require("lasso.editor.init")

-- plugin manager
require("lasso.lazy")
```

### `lazy,lua`
```
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })

  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})

    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
	-- remember to change the path to where your plugins are
    { import = "lasso.plugins" },
  },
  checker = { enabled = true },
})
```
This is the code for the Lazy plugin manager to work properly. 

### `editor/init.lua`
In this file we'll require another two files as well: 
- `opts.lua`
- `keybinds.lua`

```
-- editor settings
require("lasso.editor.opts")

-- custom keybinds
require("lasso.editor.keybinds")
```

#### `editor/opts.lua`
This file will contain configuration settings such as indentation size, editor behavior, and even some aesthetic preferences.

```
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

```

#### `editor/keybinds.lua`
This file contains the most important keybinds for me: 

```
-- here goes the custom keybinds
vim.g.mapleader = " " 
local km = vim.keymap

km.set({ "n", "v" }, "j", "jzz", { desc = "keep cursor in the center" })
km.set({ "n", "v" }, "k", "kzz", { desc = "keep cursor in the center" })

-- movement 
-- thanks ThePrimeAgen
km.set("v", "<C-j>", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })
km.set("v", "<C-k>", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" })

-- splits
km.set('n', '<C-h>', '<C-w><C-h>', { desc = 'move focus to the left window' })
km.set('n', '<C-l>', '<C-w><C-l>', { desc = 'move focus to the right window' })
km.set('n', '<C-j>', '<C-w><C-j>', { desc = 'move focus to the lower window' })
km.set('n', '<C-k>', '<C-w><C-k>', { desc = 'move focus to the upper window' })

km.set("n", "<leader>sn", "<cmd>vsplit<cr>", { desc = "create vertical split" })
km.set("n", "<leader>se", "<cmd>close<cr>", { desc = "close current split" })
```