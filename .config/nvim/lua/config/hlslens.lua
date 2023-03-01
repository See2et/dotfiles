local status, hlslens = pcall(require, 'hlslens')
if not status then print('hlslens is not installed') return end

hlslens.setup()
