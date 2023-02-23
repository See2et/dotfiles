local status, cmdline = pcall(require, 'fine-cmdline')
if not status then return end

cmdline.setup({
  cmdline = {
    enable_keymaps = true,
    smart_history = true,
    prompt = '> '
  },
  popup = {
    relative = 'editor',
    position = {
      row = '30%',
      col = '50%',
    },
    size = {
      width = '40%',
    },
    border = {
      text = {
        top = "Command Line",
      },
      style = 'double',
      padding = { 0, 2 },
    },
    win_options = {
      winblend = 0,
      winhighlight = 'Normal:Normal,NormalNC:NormalNC',
    },
  },
})
