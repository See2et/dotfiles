require('which-key').register({
  d = { require('telescope.builtin').diagnostics, '[;] Fuzzy [D]iagnositcs' },
  f = { require('telescope.builtin').find_files, '[;] Fuzzy [F]iles' },
  g = { require('telescope.builtin').live_grep, '[;] Fuzzy by [G]rep' },
  h = { require('telescope.builtin').help_tags, '[;] Fuzzy [H]elp' },
  s = { require('telescope.builtin').grep_string, '[;] Fuzzy [S]tring' },
  r = { require('telescope.builtin').oldfiles, '[;] Fuzzy [R]ecently' },
  e = { require('telescope.builtin').buffers, '[;] Fuzzy [E]xisting' },
  n = { '<cmd>Telescope noice<cr>', '[;] Fuzzy [N]oice' },
  c = {
    function()
      require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes')
        .get_dropdown {
          previewer = false,
        })
    end, '[;] Fuzzy [C]urrent' },
  [";"] = { "/", "[;] Search" },
  t = { '<cmd>ToggleTerm<cr>', '[;] Toggle [T]erm' },
  z = { '<cmd>ZenMode<cr>', '[;] Toggle [Z]enMode' },
}, { prefix = ";" })

vim.keymap.set("t", ";t", "<cmd>ToggleTerm<cr>")
