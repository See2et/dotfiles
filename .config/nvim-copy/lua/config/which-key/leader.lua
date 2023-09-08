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
  z = {
    f = { "<cmd>lua require('telekasten').find_notes()<cr>", "find notes" },
    d = { "<cmd>lua require('telekasten').find_daily_notes()<cr>", "find daily notes" },
    g = { "<cmd>lua require('telekasten').search_notes()<cr>", "search notes" },
    z = { "<cmd>lua require('telekasten').follow_link()<cr>", "follow link" },
    T = { "<cmd>lua require('telekasten').goto_today()<cr>", "goto today" },
    W = { "<cmd>lua require('telekasten').goto_thisweek()<cr>", "goto this week" },
    w = { "<cmd>lua require('telekasten').find_weekly_notes()<cr>", "find weekly notes" },
    n = { "<cmd>lua require('telekasten').new_note()<cr>", "new note" },
    N = { "<cmd>lua require('telekasten').new_templated_note()<cr>", "new templated note" },
    y = { "<cmd>lua require('telekasten').yank_notelink()<cr>", "yank notelink" },
    c = { "<cmd>lua require('telekasten').show_calendar()<cr>", "show calendar" },
    C = { "<cmd>CalendarT<cr>", "CalendarT" },
    i = { "<cmd>lua require('telekasten').paste_img_and_link()<cr>", "paste img and link" },
    t = { "<cmd>lua require('telekasten').toggle_todo()<cr>", "toggle todo" },
    b = { "<cmd>lua require('telekasten').show_backlinks()<cr>", "show backlinks" },
    F = { "<cmd>lua require('telekasten').find_friends()<cr>", "find friends" },
    I = { "<cmd>lua require('telekasten').insert_img_link({ i=true })<cr>", "insert img link" },
    p = { "<cmd>lua require('telekasten').preview_img()<cr>", "preview img" },
    m = { "<cmd>lua require('telekasten').browse_media()<cr>", "browse media" },
    a = { "<cmd>lua require('telekasten').show_tags()<cr>", "show tags" },
    ["#"] = { "<cmd>lua require('telekasten').show_tags()<cr>", "show tags" },
    r = { "<cmd>lua require('telekasten').rename_note()<cr>", "rename note" },
  }
}, { prefix = "<leader>" })
