local status, term = pcall(require, "toggleterm")
if (not status) then return end

term.setup {
	open_mapping = [[<C-f>]],
	direction = "float",
	hidden = true,
  shell = 'fish'
}

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
	cmd = "lazygit",
	direction = "float",
	hidden = true
})

function _lazygit_toggle()
	lazygit:toggle()
end

vim.keymap.set("n", "gl", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
