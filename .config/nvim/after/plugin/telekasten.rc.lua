local status, telekasten = pcall(require, 'telekasten')
if not status then print('telekasten is not installed') return end

telekasten.setup {
  -- idk reason, but telekasten doesn't read a relative path correctly
  home =  '/Users/see2et/Documents/telekasten',
}
