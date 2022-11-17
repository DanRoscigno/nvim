vim.cmd([[packadd packer.nvim]])
require("packer").startup(function()
  use("wbthomason/packer.nvim")
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }
  require('lspconfig').grammarly.setup{
	init_options = { clientId = 'client_BaDkMgx4X19X9UxxYRCXZo', },
	cmd = { "grammarly-languageserver", "--stdio" },
  }
  use("morhetz/gruvbox")
  vim.cmd([[colorscheme gruvbox]])
  use("nvim-treesitter/nvim-treesitter")
  -- use ('https://github.com/rhysd/vim-grammarous')
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
  use('tpope/vim-fugitive')
  use {
  'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsigns').setup()
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
  use("junegunn/fzf")
  use("junegunn/fzf.vim")
  use('voldikss/vim-floaterm')
end)
