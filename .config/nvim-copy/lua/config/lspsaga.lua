local status, saga = pcall(require, "lspsaga")
if not status then return end

saga.setup({
  ui = {
    theme = 'round',
    winblend = 0,
    border = 'double',
    colors = {
      normal_bg = ""
    }
  }
})