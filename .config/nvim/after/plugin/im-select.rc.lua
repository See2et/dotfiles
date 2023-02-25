local status, im_select = pcall(require, 'im_select')
if not status then print('im_select is not installed') return end

im_select.setup {
  default_im_select = 'com.apple.keylayout.British',
}
