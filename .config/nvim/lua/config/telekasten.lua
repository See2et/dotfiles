local status, telekasten = pcall(require, 'telekasten')
if not status then
  print('telekasten is not installed')
  return
end

local home = vim.fn.expand("~/Documents/40_2nd-brain")

telekasten.setup {
    -- idk reason, but telekasten doesn't read a relative path correctly
    home                  = home,
    dailies               = home .. '/' .. 'Calendar',
    weeklies              = home .. '/' .. 'Calendar',
    templates             = home .. '/' .. 'Extras' .. '/' .. 'Templates',
    command_palette_theme = 'dropdown',
}
