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
