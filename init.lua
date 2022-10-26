vim.opt.number = true
vim.cmd([[packadd packer.nvim]])
require("packer").startup(function()
  use {
  "folke/which-key.nvim",
  config = function()
    require("which-key").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
  }
  use("wbthomason/packer.nvim")
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }
  use("morhetz/gruvbox")
  vim.cmd([[colorscheme gruvbox]])
  use("nvim-treesitter/nvim-treesitter")
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
  use('tpope/vim-fugitive')

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
-- Start Grammarous check
vim.api.nvim_set_keymap("n", "<leader>gc", ":GrammarousCheck<CR>", { noremap = true })
-- Cancel Grammarous check
vim.api.nvim_set_keymap("n", "<leader>gq", ":GrammarousReset<CR>", { noremap = true })
vim.cmd([[
let g:grammarous#hooks = {}
let g:grammarous#info_window_height = 6
function! g:grammarous#hooks.on_check(errs) abort
  nmap <buffer><C-n> <Plug>(grammarous-move-to-next-error)
  nmap <buffer><C-w> <Plug>(grammarous-move-to-info-window)
  nmap <buffer><C-p> <Plug>(grammarous-move-to-previous-error)
  nmap <buffer><C-f> <Plug>(grammarous-fixit)
  nmap <buffer><C-i> <Plug>(grammarous-remove-error) <Plug>(grammarous-move-to-next-error)
endfunction
function! g:grammarous#hooks.on_reset(errs) abort
  nunmap <buffer><C-n>
  nunmap <buffer><C-p>
  nunmap <buffer><C-f>
  nunmap <buffer><C-i>
endfunction
]])

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

-- Basic statusline, uses Fugitive to get the git branch
vim.cmd([[
set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{FugitiveStatusline()}
set statusline+=%#LineNr#
set statusline+=\ %t
set statusline+=\ %m
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %p%%
set statusline+=\ %l:%c
]])
