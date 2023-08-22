vim.cmd.colorscheme("tokyonight")

local opt = vim.opt

opt.clipboard:append { 'unnamedplus' }

opt.writebackup = false
opt.backup = false
opt.swapfile = false

opt.cursorline = true
opt.number = false
opt.showmatch = true

opt.expandtab = true
opt.shiftwidth = 2
opt.softtabstop = 2
opt.tabstop = 2
opt.smartindent = true
opt.autoindent = true
opt.hlsearch = true

opt.laststatus = 3
opt.scrolloff = 10

opt.mouse = 'a'

opt.cmdheight = 0

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  command = "lua vim.lsp.buf.format()"
})
