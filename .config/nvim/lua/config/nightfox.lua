local status, nightfox = pcall(require, 'nightfox')
if not status then print('nightfox is not installed') return end
-- Default options
nightfox.setup({
  options = {
    -- Compiled file's destination location
    transparent = true,     -- Disable setting background
    styles = {               -- Style to be applied to different syntax groups
      comments = "italic",     -- Value is any valid attr-list value `:help attr-list`
    },
  },
})
