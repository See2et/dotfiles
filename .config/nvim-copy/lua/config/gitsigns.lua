local status, gitsigns = pcall(require, 'gitsigns')
if not status then print('gitsigns is not installed') return end

gitsigns.setup {
  signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
}

