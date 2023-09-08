local status, tokyonight = pcall(require, 'tokyonight')
if not status then print('tokyonight is not installed') return end

tokyonight.setup {
  transparent = true,
  styles = {
    -- sidebars = 'transparent',
    floats = 'transparent',
  }
}

