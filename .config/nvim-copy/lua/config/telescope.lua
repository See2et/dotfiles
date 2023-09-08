local status, telescope = pcall(require, 'telescope')
if not status then print('telescope is not installed') return end

local builtin = require('telescope.builtin')

local fb_actions = require "telescope".extensions.file_browser.actions

-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
telescope.setup {
  defaults = {
    -- Telescope doesn't show preview when a font size is too big
    -- When you can't find preview, try making it smaller
    previewer = true,
    mappings = {
      n = {
				["<C-[>"] = require('telescope.actions').close,
        ["<leader>q"] = require('telescope.actions').close,
			},
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
        ["<leader>q"] = require('telescope.actions').close,
      },
    },
  },
  extensions = {
    file_browser = {
      theme = "dropdown",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        -- your custom insert mode mappings
        ["i"] = {
          ["<C-w>"] = function() vim.cmd('normal vbd') end,
        },
        ["n"] = {
          -- your custom normal mode mappings
          ["N"] = fb_actions.create,
          ["h"] = fb_actions.goto_parent_dir,
          ["/"] = function()
            vim.cmd('startinsert')
          end
        },
      },
      path = "%:p:h",
      cwd = vim.fn.expand('%:p:h'),
		  respect_gitignore = false,
		  hidden = true,
	    grouped = true,
  	  initial_mode = "normal",
		  layout_config = { height = 40 }
    },
  },
}

-- It shoud be after telescope.setup()
pcall(telescope.load_extension, 'file_browser')

-- Enable telescope fzf native, if installed
pcall(telescope.load_extension, 'fzf')
