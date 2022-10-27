-- Open recently used files
vim.api.nvim_set_keymap("n", "<leader>fr", ":History<CR>", { noremap = true })
-- Open files in same directory as current file
vim.api.nvim_set_keymap("n", "<leader>ff", ":e %:h/<C-d>", { noremap = true })
-- Start Grammarous check
vim.api.nvim_set_keymap("n", "<leader>gc", ":GrammarousCheck<CR>", { noremap = true })
-- Cancel Grammarous check
vim.api.nvim_set_keymap("n", "<leader>gq", ":GrammarousReset<CR>", { noremap = true })
-- Note: further Grammarous keybindings are in config.lua
-- Floaterm
-- let g:floaterm_keymap_toggle = '<Leader>t'
vim.api.nvim_set_keymap("n", "<leader>t", ":FloatermToggle<CR>", { noremap = true })
vim.api.nvim_set_keymap("t", "<leader>t", '<C-\\><C-n>:FloatermToggle<CR>', { noremap = true })
