local status, autotag = pcall(require, "nvim-ts-autotag")
if not status then print('nvim-ts-autotag is not installed') return end

autotag.setup({})
