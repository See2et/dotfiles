vim.fn["skkeleton#config"]({ globalJisyo =  '~/.skk/SKK-JISYO.L' })
vim.keymap.set("i", "<C-j>", "<Plug>(skkeleton-enable)")
vim.keymap.set("c", "<C-j>", "<Plug>(skkeleton-enable)")