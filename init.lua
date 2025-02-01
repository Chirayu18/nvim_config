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
-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
local opts = { noremap = true, silent = true }

-- Shorten function name
local map = vim.api.nvim_set_keymap

-- Map leader
map("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

map("i", "jj", "<ESC>", opts)

-- Copy to Clipboard
--map("n", "<leader>y", '"+y', opts)
--map("n", "<leader>Y", '"+Y', opts)
--map("v", "<leader>y", '"+y', opts)
--map("v", "<leader>Y", '"+Y', opts)

-- Paste from clipboard
--map("n", "<leader>p", '"+p', opts)
--map("n", "<leader>P", '"+P', opts)
--map("v", "<leader>p", '"+p', opts)
--map("v", "<leader>P", '"+P', opts)

-- Paste from yanked registry
map("n", "<leader>p", '"0p', opts)
map("n", "<leader>P", '"0P', opts)
map("v", "<leader>p", '"0p', opts)
map("v", "<leader>P", '"0P', opts)

map("n", "<leader>no", ":nohl<CR>", opts)
map("n", "<leader>w", ":w<CR>", opts)
map("n", "<leader>W", ":wq!<CR>", opts)
map("n", "<leader>q", ":q<CR>", opts)
map("n", "<leader>Q", ":qall!<CR>", opts)

map("n", "<C-b>", [[<Cmd>lua require"fzf-lua".buffers()<CR>]], {})
map("n", "<C-k>", [[<Cmd>lua require"fzf-lua".builtin()<CR>]], {})
map("n", "<C-m>", [[<Cmd>lua require"fzf-lua".marks()<CR>]], {})
map("n", "<C-f>", [[<Cmd>lua require"fzf-lua".zoxide()<CR>]], {})
map("n", "<C-p>", [[<Cmd>lua require"fzf-lua".files()<CR>]], {})
map("n", "<C-l>", [[<Cmd>lua require"fzf-lua".live_grep_glob()<CR>]], {})
map("n", "<C-g>", [[<Cmd>lua require"fzf-lua".grep_project()<CR>]], {})
map("n", "<C-h>", [[<Cmd>lua require"fzf-lua".oldfiles()<CR>]], {})
map("n", "<F1>", [[<Cmd>lua require"fzf-lua".help_tags()<CR>]], {})

vim.opt.number = true
vim.opt.syntax = enable
vim.opt.completeopt = menu
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = a
vim.opt.cmdheight = 1
vim.opt.ignorecase = true
vim.opt.magic = true
vim.opt.smarttab = true
vim.opt.showmatch = true
vim.opt.hidden = true
vim.opt.updatetime = 300
vim.opt.shada = "'1000,f1,<500"
vim.opt.undofile = true
vim.opt.modifiable = true


-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- add your plugins here
	{
	  "ibhagwan/fzf-lua",
	  -- optional for icon support
	  dependencies = { "nvim-tree/nvim-web-devicons" },
	  -- or if using mini.icons/mini.nvim
	  -- dependencies = { "echasnovski/mini.icons" },
	  opts = {}
	},
}
  ,
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
