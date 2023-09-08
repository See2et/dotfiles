local keymap = vim.keymap
local kmap = keymap.set
local nmap = function(key, map, ops)
  kmap("n", key, map, ops)
end
local tmap = function(key, map, ops)
  kmap("t", key, map, ops)
end

vim.g.mapleader = " "

tmap('<ESC>', '<C-\\><C-n>')

nmap('sh', '<C-w>h')
nmap('sj', '<C-w>j')
nmap('sk', '<C-w>k')
nmap('sl', '<C-w>l')

nmap('<C-h>', '<C-w>>')
nmap('<C-j>', '<C-w>+')
nmap('<C-k>', '<C-w>-')
nmap('<C-l>', '<C-w><')
