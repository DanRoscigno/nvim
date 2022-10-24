vim.opt.number = true
vim.cmd([[packadd packer.nvim]])
require("packer").startup(function()
  use("wbthomason/packer.nvim")
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }
  use("morhetz/gruvbox")
  vim.cmd([[colorscheme gruvbox]])
  use("nvim-treesitter/nvim-treesitter")
  use ('nvim-lualine/lualine.nvim')
  use ('https://github.com/rhysd/vim-grammarous')
  use {
  "folke/zen-mode.nvim",
  config = function()
    require("zen-mode").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
}

  require("mason").setup()
  require("mason-lspconfig").setup()
  require'lspconfig'.marksman.setup{}

  require("nvim-treesitter.configs").setup({
    ensure_installed = { "lua", "markdown" },
    highlight = {
      enable = false,
    },
  })
  require("lualine").setup({
    options = {
      icons_enabled = false,
      theme = "auto",
    },
  })
  use("junegunn/fzf")
  use("junegunn/fzf.vim")
end)

vim.opt.list = true
vim.opt.listchars:append("tab:> ")
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.swapfile = false
vim.opt.wrap = false
-- Map global leader from \ to Space
vim.g.mapleader = " "
-- Open recently used files
vim.api.nvim_set_keymap("n", "<leader>fr", ":History<CR>", { noremap = true })
-- Open files in same directory as current file
vim.api.nvim_set_keymap("n", "<leader>ff", ":e %:h/<C-d>", { noremap = true })

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "qf", "help", "man", "lspinfo", "spectre_panel" },
	callback = function()
		vim.cmd([[
      nnoremap <silent> <buffer> q :close<CR> 
      set nobuflisted 
    ]])
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "gitcommit"},
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "markdown" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})

