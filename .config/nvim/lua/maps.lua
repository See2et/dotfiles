local keymap = vim.keymap
local kmap = keymap.set
local nmap = function(key, map, ops)
  kmap("n", key, map, ops)
end
local tmap = function(key, map, ops)
  kmap("t", key, map, ops)
end

-- Leader
vim.g.mapleader = " "

-- Terminal
tmap('<ESC>', '<C-\\><C-n>')
-- tmap('<leader><leader>t', '<cmd>ToggleTerm<cr>', { silent = true })

nmap('sh', '<C-w>h')
nmap('sj', '<C-w>j')
nmap('sk', '<C-w>k')
nmap('sl', '<C-w>l')

nmap('<C-h>', '<C-w>>')
nmap('<C-j>', '<C-w>+')
nmap('<C-k>', '<C-w>-')
nmap('<C-l>', '<C-w><')
