local status, hop = pcall(require, 'hop')
if not status then return end

hop.setup({
  create_hl_autocmd = false
})

vim.keymap.set('n', 'mw', '<cmd>HopWord<cr>', { silent = true })
vim.keymap.set('n', 'ml', '<cmd>HopLine<cr>', { silent = true })
vim.keymap.set('n', 'mc', '<cmd>HopChar2<cr>', { silent = true })

vim.api.nvim_command('highlight HopNextKey guibg=none')
vim.api.nvim_command('highlight HopNextKey1 guibg=none')
vim.api.nvim_command('highlight HopNextKey2 guibg=none')
vim.api.nvim_command('highlight HopUnmatched guibg=none')
