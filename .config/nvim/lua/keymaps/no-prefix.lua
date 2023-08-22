require("which-key").register({
  m = {
    w = { '<cmd>HopWord<cr>', '[M]ove to [W]ord' },
    s = { '<cmd>HopLineStart<cr>', '[M]ove to Line [S]tart' },
    l = { '<cmd>HopLine<cr>', '[M]ove to [L]ine' },
    c = { '<cmd>HopChar2<cr>', '[M]ove to [C]hars' },
    a = { '<cmd>HopAnywhere<cr>', '[M]ove to [A]nywhere' },
  },
  s = {
    s = { '<cmd>split<cr><C-w>w', '[S]plit', { silent = true } },
    v = { '<cmd>vsplit<cr><C-w>w', '[S]plit [V]ertical', { silent = true } },
  },
  t = {
    e = { '<cmd>tabedit<cr>', '[T]ab [E]dit', { silent = true } },
    d = { '<cmd>tabclose<cr>', '[T]ab [D]elete', { silent = true } },
    l = { '<cmd>BufferLineCycleNext<cr>', 'Go Prev [T]ab' },
    h = { '<cmd>BufferLineCyclePrev<cr>', 'Go Next [T]ab' },
  },
  U = { '<C-r>', 'Reset' },
  ['['] = {
    d = { '<cmd>Lspsaga diagnostic_jump_next<cr>', 'Jump Next [D]iagnostics' }
  },
  [']'] = {
    d = { '<cmd>Lspsaga diagnostic_jump_prev<cr>', 'Jump Prev [D]iagnostics' }
  },
  ['<C-l>'] = { '<C-w><' },
  ['<C-h>'] = { '<C-w>>' },
  ['<C-j>'] = { '<C-w>+' },
  ['<C-k>'] = { '<C-w>-' },
  ['<C-[>'] = { '<cmd>noh<cr>', 'No Highlight' }
}, {})

vim.keymap.set({ 'n', 'v' }, 'J', '<C-d>')
vim.keymap.set({ 'n', 'v' }, 'K', '<C-u>')
vim.keymap.set({ 'n', 'v' }, 'L', '$')
vim.keymap.set({ 'n', 'v' }, 'H', '^')
vim.keymap.set({ 'n', 'v' }, 'mm', '%')
