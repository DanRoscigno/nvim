vim.opt.number = true
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
-- Basic statusline, uses Fugitive to get the git branch
vim.cmd([[
set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{get(b:,'gitsigns_head','')}
set statusline+=\ 
set statusline+=%{get(b:,'gitsigns_status','')}
set statusline+=%#LineNr#
set statusline+=\ %t
set statusline+=\ %m
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %p%%
set statusline+=\ %l:%c
]])

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
