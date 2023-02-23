local status, prettier = pcall(require, 'prettier')
if not status then print('prettier is not installed') return end

prettier.setup {
  bin = 'prettierd',
  filetypes = {
    "css",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "json",
    "scss",
  }
}


