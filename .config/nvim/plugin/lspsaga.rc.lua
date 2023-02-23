local status, saga = pcall(require, "lspsaga")
if (not status) then return end

saga.setup({
  ui = {
    theme = 'round',
    winblend = 0,
    border = 'double',
    colors = {
      normal_bg = ""
    }
  }
})

-- local diagnostic = require("lspsaga.diagnostic")
-- local opts = { noremap = true, silent = true }
-- vim.keymap.set("n", "<leader>d", "<cmd>Lspsaga hover_doc<CR>")
-- vim.keymap.set('n', '<leader>sr', '<cmd>Lspsaga lsp_finder<CR>')
vim.keymap.set("n", "<leader>pd", "<cmd>Lspsaga peek_definition<CR>")
vim.keymap.set("n", "<leader>sd", "<cmd>Lspsaga show_line_diagnostics<CR>")
-- vim.keymap.set("n", "[e", "<cmd>Lspsaga diagnostic_jump_next<CR>")
-- vim.keymap.set("n", "]e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
-- vim.keymap.set({ "n", "t" }, "<C-f>", "<cmd>Lspsaga term_toggle<CR>")
-- vim.keymap.set({ "n", "t" }, "[", "<cmd>Lspsaga term_toggle lazygit<CR>")

-- code action
-- local codeaction = require("lspsaga.codeaction")
-- vim.keymap.set("n", "<leader>ca", function() codeaction:code_action() end, { silent = true })
-- vim.keymap.set("v", "<leader>ca", function()
--  vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-U>", true, false, true))
--  codeaction:range_code_action()
-- end, { silent = true })
