require("which-key").register({
  f = {
    n = { "<cmd>lua require('telekasten').find_notes()<cr>", "[F]ind [N]otes" },
    d = { "<cmd>lua require('telekasten').find_daily_notes()<cr>", "[F]ind [D]aily Notes" },
    w = { "<cmd>lua require('telekasten').find_weekly_notes()<cr>", "[F]ind [W]eekly Notes" },
    f = { "<cmd>lua require('telekasten').find_friends()<cr>", "[F]ind [F]riends" },
    m = { "<cmd>lua require('telekasten').browse_media()<cr>", "[F]ind [M]edia" },
    l = { "<cmd>lua require('telekasten').follow_link()<cr>", "[F]ollow [L]ink" },
  },
  s = {
    c = { "<cmd>lua require('telekasten').show_calendar()<cr>", "[S]how [C]alender" },
    b = { "<cmd>lua require('telekasten').show_backlinks()<cr>", "[S]how [B]acklinks" },
    t = { "<cmd>lua require('telekasten').show_tags()<cr>", "[S]how [T]ags" },
    n = { "<cmd>lua require('telekasten').search_notes()<cr>", "[S]earch [N]otes" },
  },
  g = {
    t = { "<cmd>lua require('telekasten').goto_today()<cr>", "goto today" },
    w = { "<cmd>lua require('telekasten').goto_thisweek()<cr>", "goto this week" },
  },
  c = {
    n = { "<cmd>lua require('telekasten').new_note()<cr>", "[C]reate [N]ew Note" },
    t = { "<cmd>lua require('telekasten').new_templated_note()<cr>", "[C]reate new [T]emplated Note" },
    e = { "<cmd>CalendarT<cr>", "[C]al[E]ndarT" },
  },
  r = {
    n = { "<cmd>lua require('telekasten').rename_note()<cr>", "[R]ename [N]ote" },
  },
  y = {
    l = { "<cmd>lua require('telekasten').yank_notelink()<cr>", "[Y]ank Note[L]ink" },
  },
  t = {
    t = { "<cmd>lua require('telekasten').toggle_todo()<cr>", "[T]oggle [T]odo" },
  },
  i = { "<cmd>lua require('telekasten').paste_img_and_link()<cr>", "Paste Img and Link" },
  I = { "<cmd>lua require('telekasten').insert_img_link({ i=true })<cr>", "[I]nsert Img Link" },
  p = {
    i = { "<cmd>lua require('telekasten').preview_img()<cr>", "[P]review [I]mg" },
  }
}, { prefix = "z" })
