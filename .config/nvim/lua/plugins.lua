-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
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

require('lazy').setup({
  -- Package manager itself
  { "folke/lazy.nvim", tag = "stable" },
  -- NOTE: This is where your plugins related to LSP can be installed.
  --  The configuration is done below. Search for lspconfig to find it below.
  { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    lazy = true,
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      {'williamboman/mason.nvim'},
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim', opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',

      -- prettier
      { 'MunifTanjim/prettier.nvim', 
        dependencies = {
          -- make non-lsp systems work with LSP
          'jose-elias-alvarez/null-ls.nvim',
        }
      },

      -- LSP UI
      {
        'glepnir/lspsaga.nvim',
        dependencies = {
          {"nvim-tree/nvim-web-devicons"},
          --Please make sure you install markdown and markdown_inline parser
          {"nvim-treesitter/nvim-treesitter"}
        }
      }
    },
  },

  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    lazy = true,
    dependencies = {
      -- Sources
      'hrsh7th/cmp-nvim-lsp',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      -- Awesome Snippets
      'rafamadriz/friendly-snippets',
      -- VScode-like pictograms
      'onsails/lspkind.nvim',
    },
  },

  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim', opts = {} },

  -- Theme
  { 'EdenEast/nightfox.nvim' },
  { 'folke/tokyonight.nvim' },

  { -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    lazy = true,
  },

  { -- Tab
    'akinsho/bufferline.nvim',
    lazy = true,
    dependencies = {'nvim-tree/nvim-web-devicons'}
  },

  -- Fuzzy Finder (files, lsp, etc)
  { 'nvim-telescope/telescope.nvim', lazy = true, version = '*', dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-file-browser.nvim' } },

  -- Fuzzy Finder Algorithm which requires local dependencies to be built.
  -- Only load if `make` is available. Make sure you have the system
  -- requirements installed.
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    -- NOTE: If you are having trouble with this installation,
    --       refer to the README for telescope-fzf-native for more instructions.
    lazy = true,
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },

  { -- Highlight, edit, and navigate code
    -- When you see some erros, try `:cheackhelath nvim-treesitter`, and `:TSInstall! <lang-name>`
    'nvim-treesitter/nvim-treesitter',
    lazy = true,
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    config = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  },
  -- adds indentation guides to all lines (including empty lines)
  { "lukas-reineke/indent-blankline.nvim", lazy = true },

  { -- EasyMotion
    'phaazon/hop.nvim',
    lazy = true,
    branch = 'v2', -- optional but strongly recommended
  },

  -- GitHub Copilot
  -- It needs tab key is not mapped by other plugins
  { 'github/copilot.vim', lazy = true },

  -- Display a number of serach results
  { 'kevinhwang91/nvim-hlslens', lazy = true },

  -- Awesome autopair plugin
  { 'windwp/nvim-autopairs', lazy = true },
  -- Also autopair for html tags
  { 'windwp/nvim-ts-autotag', lazy = true },

  -- Adds git releated signs to the gutter, as well as utilities for managing changes
  { 'lewis6991/gitsigns.nvim', lazy = true },

  -- Discord Rich Presence 
  { 'andweeb/presence.nvim', lazy = true },

  -- needs to install im-select
  { 'keaising/im-select.nvim', lazy = true },
}, {})
