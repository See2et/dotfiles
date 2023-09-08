local status, autopairs = pcall(require, 'nvim-autopairs')
if not status then print('nvim-autopairs is not installed') return end

autopairs.setup({})
