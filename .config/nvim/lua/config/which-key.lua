local status, wk = pcall(require, 'which-key')
if not status then
  print('which-key is not installed')
  return
end

-- leader as prefix
wk.register({
    c = {
        a = { '<cmd>Lspsaga code_action<cr>', '[C]ode [A]ction' }
    },
    d = { '<cmd>Lspsaga hover_doc<cr>', 'Show [D]ocumentatoin' },
    f = {
        d = { require('telescope.builtin').diagnostics, '[F]uzzy [D]iagnositcs' },
        f = { require('telescope.builtin').find_files, '[F]uzzy [F]iles' },
        g = { require('telescope.builtin').live_grep, '[F]uzzy by [G]rep' },
        h = { require('telescope.builtin').help_tags, '[F]uzzy [H]elp' },
        s = { require('telescope.builtin').grep_string, '[F]uzzy [S]tring' },
        m = { function() vim.lsp.buf.format { async = true } end, '[F]or[m]at' }
    },
    g = {
        d = { '<cmd>Lspsaga goto_definition<cr>', '[G]oto [D]efinition' },
        r = { require('telescope.builtin').lsp_references, '[G]oto [R]eferences' }
    },
    o = {
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
        t = { '<cmd>terminal fish<cr>', '[O]pen [T]erminal' },
    },
    q = { '<cmd>q!<cr>', '[Q]uit' },
    r = {
        n = { '<cmd>Lspsaga rename<cr>', '[R]e[n]ame' }
    },
    s = {
        d = { '<cmd>Lspsaga show_line_diagnostics<cr>', '[S]how Line [D]iagnostics' },
        o = { '<cmd>so<cr>', ':so' }
    },
    -- t = {'<cmd>ToggleTerm<cr>', { silent = true}},
    w = { '<cmd>w<cr>', ':[w]' },
    z = {
        [''] = { '<cmd>Telekasten panel<cr>', '[Z]ettelkasten' },
        f = { '<cmd>Telekasten find_notes<cr>', '[Z]ettelkasten [F]ind' },
        g = { '<cmd>Telekasten search_notes<cr>', '[Z]ettelkasten [G]rep' },
        d = { '<cmd>Telekasten goto_today<cr>', '[Z]ettelkasten [D]ate' },
        z = { '<cmd>Telekasten follow_link<cr>', '[Z]ettelkasten [Z]ettel' },
        n = { '<cmd>Telekasten new_note<cr>', '[Z]ettelkasten [N]ew' },
        c = { '<cmd>Telekasten show_calendar<cr>', '[Z]ettelkasten [C]alendar' },
        b = { '<cmd>Telekasten show_backlinks<cr>', '[Z]ettelkasten [B]acklinks' },
        i = { '<cmd>Telekasten insert_link<cr>', '[Z]ettelkasten [I]nsert Link' },
        I = { '<cmd>Telekasten insert_img_link<cr>', '[Z]ettelkasten [I]mage' },
    }
}, { prefix = "<leader>" })

-- nothing as prefix
wk.register({
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
