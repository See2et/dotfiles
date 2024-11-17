return {
  {
    "folke/zen-mode.nvim",
    cmd = { "ZenMode" }
  },

  {
    'folke/which-key.nvim',
    lazy = false,
  },

  {
    'akinsho/toggleterm.nvim',
    cmd = { "ToggleTerm" },
    version = "*",
    config = function()
      require('toggleterm').setup {
        direction = 'float',
        shell = 'fish',
        float_opts = {
          border = 'curved'
        }
      }
    end
  },

  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-file-browser.nvim',
    },
    config = function()
      require('telescope').setup {
        defaults = {
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
            hijack_netrw = true,
            mappings = {
              ["i"] = {
                ["<C-w>"] = function() vim.cmd('normal vbd') end,
              },
              ["n"] = {
                -- your custom normal mode mappings
                ["N"] = require("telescope").extensions.file_browser.actions.create,
                ["h"] = require("telescope").extensions.file_browser.actions.goto_parent_dir,
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
      require('telescope').load_extension('noice')
      require('telescope').load_extension('file_browser')
    end
  },

  {
    'phaazon/hop.nvim',
    cmd = {
      "HopWord",
      "HopLineStart",
      "HopLine",
      "HopChar2",
      "HopAnywhere"
    },
    config = function()
      require('hop').setup()
    end
  },

  {
    'lewis6991/gitsigns.nvim',
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require('gitsigns').setup {}
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("ibl").setup()
    end,
  },

  {
    "norcalli/nvim-colorizer.lua",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("colorizer").setup()
    end,
  },

  {
    "windwp/nvim-autopairs",
    event = { "InsertEnter" },
    config = function()
      require("nvim-autopairs").setup()
    end,
  },

  {
    "j-hui/fidget.nvim",
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    config = function()
      require("noice").setup({
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },
        -- you can enable a preset for easier configuration
        presets = {
          bottom_search = true,         -- use a classic bottom cmdline for search
          command_palette = true,       -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false,           -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = false,       -- add a border to hover docs and signature help
        },
      })
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    }
  },

  {
    "akinsho/bufferline.nvim",
    config = function()
      require("bufferline").setup({
        options = {
          mode = "tabs",
          separator_style = 'slant',
          always_show_bufferline = false,
          show_buffer_close_icons = false,
          show_close_icon = false,
          color_icons = true
        },
        highlights = {
          separator = {
            fg = '#073642',
            bg = '#002b36'
          },
          separator_selected = {
            fg = '#073642',
          },
          background = {
            fg = '#657b83',
            bg = '#002b36'
          },
          buffer_selected = {
            fg = '#fdf6e3',
            bold = true,
          },
          fill = {
            bg = '#073642'
          }
        },
      })
    end,
  },
}
