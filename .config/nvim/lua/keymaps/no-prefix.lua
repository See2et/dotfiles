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

vim.keymap.set('n', 'x', '"_x')


require("which-key").add({
    { "m",     group = "Move" },
    { "mw",    '<cmd>HopWord<cr>',                      desc = "[M]ove to [W]ord" },
    { "ms",    '<cmd>HopLineStart<cr>',                 desc = "[M]ove to Line [S]tart" },
    { "ml",    '<cmd>HopLine<cr>',                      desc = "[M]ove to [L]ine" },
    { "mc",    '<cmd>HopChar2<cr>',                     desc = "[M]ove to [C]hars" },
    { "ma",    '<cmd>HopAnywhere<cr>',                  desc = "[M]ove to [A]nywhere" },

    { "s",     group = "Window" },
    { "ss",    '<cmd>split<cr><C-w>w',                  desc = "[S]plit",                silent = true },
    { "sv",    '<cmd>vsplit<cr><C-w>w',                 desc = "[S]plit [V]ertical",     silent = true },
    { "sh",    '<C-w>h' },
    { "sj",    '<C-w>j' },
    { "sk",    '<C-w>k' },
    { "sl",    '<C-w>l' },

    { "t",     group = "Tab" },
    { "te",    '<cmd>tabedit<cr>',                      desc = "[T]ab [E]dit",           silent = true },
    { "td",    '<cmd>tabclose<cr>',                     desc = "[T]ab [D]elete",         silent = true },
    { "tl",    '<cmd>BufferLineCycleNext<cr>',          desc = "Go Prev [T]ab" },
    { "th",    '<cmd>BufferLineCyclePrev<cr>',          desc = "Go Next [T]ab" },

    { "U",     '<C-r>',                                 desc = "Reset" },
    { "[d",    '<cmd>Lspsaga diagnostic_jump_next<cr>', desc = "Jump Next [D]iagnostics" },
    { "]d",    '<cmd>Lspsaga diagnostic_jump_prev<cr>', desc = "Jump Prev [D]iagnostics" },
    { '<C-l>', '<C-w><' },
    { '<C-h>', '<C-w>>' },
    { '<C-j>', '<C-w>+' },
    { '<C-k>', '<C-w>-' },
    { '<C-[>', '<cmd>noh<cr>',                          desc = "No Highlight" },
})

vim.keymap.set({ 'n', 'v' }, 'J', '<C-d>')
vim.keymap.set({ 'n', 'v' }, 'K', '<C-u>')
vim.keymap.set({ 'n', 'v' }, 'L', '$')
vim.keymap.set({ 'n', 'v' }, 'H', '^')
vim.keymap.set({ 'n', 'v' }, 'mm', '%')
