local status, presence = pcall(require, 'presence')
if not status then print('presence is not installed') return end

presence.setup({

})

