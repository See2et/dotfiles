vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { "folke/lazy.nvim" },

  {
    "folke/tokyonight.nvim",
    config = function() require("config/tokyonight") end,
  },

  {
    "vim-denops/denops.vim",
    dependencies = {
      {
        "Shougo/ddc.vim",
        event = "InsertEnter",
        config = function() require("config/ddc") end,
        dependencies = {
          { "Shougo/ddc-ui-native" },
          { "Shougo/pum.vim" },
          { "Shougo/ddc-ui-pum" },
          { "Shougo/ddc-source-around" },
          { "tani/ddc-fuzzy" },
          { "Shougo/ddc-nvim-lsp" },
          { "Shougo/ddc-converter_remove_overlap" },
          { "matsui54/denops-signature_help" },
          { "matsui54/denops-popup-preview.vim" },
          {
            "vim-skk/skkeleton",
            config = function() require("config/skkeleton") end
          }
        }
      },
      --[[{
         "Shougo/ddu.vim",
        config = function() require("config/ddu") end,
        dependencies = {
          -- UI
          { "Shougo/ddu-ui-ff" },
          { "Shougo/ddu-ui-filer" },
          -- Sources
          { "Shougo/ddu-source-file" },
          { "Shougo/ddu-source-file_rec" },
          { "Shougo/ddu-source-register" },
          { "kuuote/ddu-source-mr" },
          { "lambdalisue/mr.vim" },
          { "shun/ddu-source-buffer" },
          -- Filters
          { "Shougo/ddu-filter-matcher_substring" },
          -- Kinds
          { "Shougo/ddu-kind-file" },
          -- Other Things
          { "Shougo/ddu-column-filename" },
          { "Shougo/ddu-commands.vim" }
        }
      }]]
    }
  },
  {
    'nvim-telescope/telescope.nvim',
    event = "VeryLazy",
    config = function() require('config/telescope') end,
    version = '*',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-file-browser.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        'nvim-lua/plenary.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    }
  },

  {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    config = function() require("config/lspconfig") end,
    dependencies = {
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },
      {
        "jay-babu/mason-null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
          "jose-elias-alvarez/null-ls.nvim",
        },
      },
      {
        "folke/neodev.nvim",
        ft = "lua"
      },
      {
        'glepnir/lspsaga.nvim',
        config = function() require('config/lspsaga') end,
        cmd = "Lspsaga",
        dependencies = {
          { "nvim-tree/nvim-web-devicons" },
          --Please make sure you install markdown and markdown_inline parser
          { "nvim-treesitter/nvim-treesitter" }
        }
      }
    }
  },

  {
    'folke/which-key.nvim',
    lazy = false,
    config = function()
      require('config/which-key')
    end
  },

  {
    'phaazon/hop.nvim',
    cmd = {
      "HopWord",
      "HopLineStart",
      "HopChar2",
      "HopAnywhere"
    },
    config = function() require('config/hop') end,
    branch = 'v2',
  },

  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = function() require('config/autopairs') end
  },

  {
    'windwp/nvim-ts-autotag',
    event = 'InsertEnter',
    config = function() require('config/autotag') end
  },

  {
    'nvim-lualine/lualine.nvim',
    lazy = false,
    config = function() require('config/lualine') end,
  },

  {
    'akinsho/bufferline.nvim',
    cmd = {
      'BufferLineCycleNext',
      'BufferLineCyclePrev'
    },
    event = 'BufReadPre',
    config = function() require('config/bufferline') end,
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },

  {
    'kevinhwang91/nvim-hlslens',
    event = 'BufReadPre',
    config = function() require('config/hlslens') end
  },

  {
    'andweeb/presence.nvim',
    lazy = false,
    config = function() require('config/presence') end
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    event = 'BufReadPre',
    config = function() require('config/blankline') end
  },

  {
    'lewis6991/gitsigns.nvim',
    event = 'BufReadPre',
    config = function() require('config/gitsigns') end
  },

  {
    'renerocksai/telekasten.nvim',
    event = 'VeryLazy',
    config = function() require('config/telekasten') end,
    dependencies = { 'nvim-telescope/telescope.nvim', 'renerocksai/calendar-vim' }
  },

  {
    'alunny/pegjs-vim',
    ft = 'pegjs'
  },

  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function() require('config/copilot') end,
  }
})
