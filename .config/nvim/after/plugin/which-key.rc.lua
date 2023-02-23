local status, wk = pcall(require, 'which-key')
if not status then print('which-key is not installed') return end

-- leader as prefix
wk.register({
  c = {
    a = {'<cmd>Lspsaga code_action<cr>', '[C]ode [A]ction'}
  },
  d = {'<cmd>Lspsaga hover_doc<cr>', 'Show [D]ocumentatoin'},
  g = {
    d = {'<cmd>Lspsaga goto_definition<cr>', '[G]oto [D]efinition'},
    r = {require('telescope.builtin').lsp_references, '[G]oto [R]eferences'}
  },
  o = {
    f = {function()
	        require('telescope').extensions.file_browser.file_browser({
		        path = "%:p:h",
		        cwd = vim.fn.expand('%:p:h'),
		        respect_gitignore = false,
		        hidden = true,
	  	      grouped = true,
  		      initial_mode = "normal",
		        layout_config = { height = 40 }
	        })
        end, '[O]pen [F]ile Browser'},
    t = {'<cmd>terminal fish<cr>', '[O]pen [T]erminal'},
  },
  q = {'<cmd>q!<cr>', '[Q]uit'},
  r = {
    n = {'<cmd>Lspsaga rename<cr>', '[R]e[n]ame'}
  },
  s = {
    d = {require('telescope.builtin').diagnostics, '[S]earch [D]iagnositcs'},
    f = {require('telescope.builtin').find_files, '[S]earch [F]iles'},
    g = {require('telescope.builtin').live_grep, '[S]earch by [G]rep'},
    h = {require('telescope.builtin').help_tags, '[S]earch [H]elp'},
    p = {require('telescope.builtin').grep_string, '[S]earch [P]hrase'},
    o = {'<cmd>so<cr>', ':so'}
  },
  -- t = {'<cmd>ToggleTerm<cr>', { silent = true}},
  w = {'<cmd>w<cr>', ':[w]'},
}, { prefix = "<leader>" })

-- nothing as prefix
wk.register({
  m = {
    w = {'<cmd>HopWord<cr>', '[M]ove to [W]ord'},
    l = {'<cmd>HopLine<cr>', '[M]ove to [L]ine'},
    c = {'<cmd>HopChar2<cr>', '[M]ove to [C]hars'},
  },
  s = {
    s = {'<cmd>split<CR><C-w>w', '[S]plit', { silent = true }},
    v = {'<cmd>vsplit<CR><C-w>w', '[S]plit [V]ertical', { silent = true}},
  },
  t = {
    e = {'<cmd>tabedit<CR>', '[T]ab [E]dit', { silent = true}},
    d = {'<cmd>tabclose<CR>', '[T]ab [D]elete', {silent = true}},
    l = {'<cmd>BufferLineCyclePrev<CR>', 'Go Prev [T]ab'},
    h = {'<cmd>BufferLineCycleNext<CR>', 'Go Next [T]ab'},
  },
  J = {'<C-d><C-d>', 'Go Prev Page'},
  K = {'<C-u><C-u>', 'Go Next Page'},
  L = {'$', 'Go Sentence Ending'},
  H = {'^', 'Go Sentence Beginning'},
  ['['] = {
    d = {'<cmd>Lspsaga diagnostic_jump_next<cr>', 'Jump Next [D]iagnostics'}
  },
  [']'] = {
    d = {'<cmd>Lspsaga diagnostic_jump_prev<cr>', 'Jump Prev [D]iagnostics'}
  },
  ['<C-l>'] = {'<C-w><'},
  ['<C-h>'] = {'<C-w>>'},
  ['<C-j>'] = {'<C-w>+'},
  ['<C-k>'] = {'<C-w>-'},
  ['<C-[>'] = {'<cmd>noh<cr>', 'No Highlight'}
}, {})
