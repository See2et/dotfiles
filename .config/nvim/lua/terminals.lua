vim.api.nvim_create_autocmd("TermOpen", {
  pattern = '*',
  command = ":startinsert"
})
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = '*',
  command = "setlocal norelativenumber"
})
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = '*',
  command = "setlocal nonumber"
})
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = '*',
  command = "setlocal nocursorline"
})
