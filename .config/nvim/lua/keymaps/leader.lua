require("which-key").register({
  c = {
    a = { '<cmd>Lspsaga code_action<cr>', '[C]ode [A]ction' }
  },
  d = { '<cmd>Lspsaga hover_doc<cr>', 'Show [D]ocumentatoin' },
  g = {
    d = { '<cmd>Lspsaga goto_definition<cr>', '[G]oto [D]efinition' },
  },
  l = {
    f = { '<cmd>Lspsaga lsp_finder<cr>', '[L]sp [F]inder' },
  },
  f = {
    m = { function() vim.lsp.buf.format { async = true } end, '[F]or[m]at' },
  },
  o = {
    t = { '<cmd>terminal fish<cr>', '[O]pen [T]erminal' },
    g = { '<cmd>terminal lazygit<cr>', '[O]pen [G]it' },
    f = { function()
      require('telescope').extensions.file_browser.file_browser({
        path = "%:p:h",
        cwd = vim.fn.expand('%:p:h'),
        respect_gitignore = false,
        hidden = true,
        grouped = true,
        initial_mode = "normal",
        layout_config = { height = 40 }
      })
    end, '[O]pen [F]ile Browser' },
  },
  p = {
    d = { '<cmd>Lspsaga peek_definition<cr>', '[P]eek [D]efinition' },
  },
  q = { '<cmd>q!<cr>', '[Q]uit' },
  r = {
    n = { '<cmd>Lspsaga rename<cr>', '[R]e[n]ame' }
  },
  s = {
    d = { '<cmd>Lspsaga show_line_diagnostics<cr>', '[S]how Line [D]iagnostics' },
    o = { '<cmd>so<cr>', ':so' }
  },
  w = { '<cmd>w<cr>', ':[w]' },
}, { prefix = "<leader>" })
