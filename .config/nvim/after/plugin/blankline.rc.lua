local status, indent_blanline = pcall(require, 'indent_blankline')
if not status then print('indent_blanline is not installed') return end

indent_blanline.setup {
  show_current_context = true,
  show_current_context_start = true,
}
