local status, wk = pcall(require, 'which-key')
if not status then print('which-key is not installed') return end

require("config/which-key/leader")
require("config/which-key/no-prefix")
require("config/which-key/z")
require("config/which-key/semicolon")