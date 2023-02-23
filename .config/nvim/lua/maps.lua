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

-- No Highlight
nmap('<C-[>', '<cmd>noh<cr>')
-- Move easily
nmap('J', '<C-d>')
nmap('K', '<C-u>')
nmap('H', '^')
nmap('L', '$')
-- Undo
nmap('U', '<C-r>')
-- Do not yank with x
nmap('x', '"_x')
-- Increment/decrement
nmap('+', '<C-a>')
nmap('-', '<C-x>')
-- Cut/Delete a word backwards
  -- nmap('dw', 'vb"_d')
  -- nmap('cw', 'vb"_c')
-- Select all
-- ToDo<cmd> Can't use it on Mac
nmap('<C-a>', 'gg<S-v>G')
-- Reload a buffer
nmap('<leader>rr', '<cmd>edit!<cr><cmd>echo "reloaded"<cr>')
-- Tab
nmap('te', '<cmd>tabedit<cr>', { silent = true })
nmap('td', '<cmd>tabclose<cr>', { silent = true })
-- Window
nmap('ss', '<cmd>split<cr><C-w>w', { silent = true })
nmap('sv', '<cmd>vsplit<cr><C-w>w', { silent = true })
nmap('sd', '<cmd>q<cr>', { silent = true })
kmap('', 'sh', '<C-w>h')
kmap('', 'sk', '<C-w>k')
kmap('', 'sj', '<C-w>j')
kmap('', 'sl', '<C-w>l')
nmap('<C-l>', '<C-w><')
nmap('<C-h>', '<C-w>>')
nmap('<C-j>', '<C-w>+')
nmap('<C-k>', '<C-w>-')
-- Save a file
nmap('<C-s>', '<cmd>w<cr>', { silent = true })
-- Terminal
nmap('tt', '<cmd>terminal fish<cr>', { silent = true })
nmap('<leader>t', '<cmd>ToggleTerm<cr>', { silent = true })
tmap('<ESC>', '<C-\\><C-n>')
tmap('<leader><leader>t', '<cmd>ToggleTerm<cr>', { silent = true })
-- Vimskey
nmap('mm', '<cmd>VimskeyNote<cr>', { silent = true })
-- Toggle Comment
nmap('<leader>cc', '<cmd>CommentToggle<cr>', { silent = true })
-- Cmdline
-- nmap(':', '<cmd>FineCmdline<CR>', {noremap = true})
