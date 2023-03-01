local status, telekasten = pcall(require, 'telekasten')
if not status then print('telekasten is not installed') return end

telekasten.setup {
  home = '~/zettelkasten'
}
