local status, silicon = pcall(require, 'silicon')
if not status then
  print("Silicon is not installed")
  return
end

silicon.setup({
  font = 'Cica=16',
  theme = 'Monokai Extended',
})
