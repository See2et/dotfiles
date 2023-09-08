require("which-key").register({
  m = {
    w = { '<cmd>HopWord<cr>', '[M]ove to [W]ord' },
    l = { '<cmd>HopLineStart<cr>', '[M]ove to [L]ine' },
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
  M = { '%', '[M]ove to Pair symbol' },
  J = { '<C-d><C-d>', 'Go Prev Page' },
  K = { '<C-u><C-u>', 'Go Next Page' },
  L = { '$', 'Go Sentence Ending' },
  H = { '^', 'Go Sentence Beginning' },
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
