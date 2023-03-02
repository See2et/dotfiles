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
    { "folke/lazy.nvim",         tag = "stable" },
    { 'dstein64/vim-startuptime' },
    -- NOTE: This is where your plugins related to LSP can be installed.
    --  The configuration is done below. Search for lspconfig to find it below.
    { -- LSP Configuration & Plugins
        'neovim/nvim-lspconfig',
        event = 'BufReadPre',
        config = function() require('config/lspconfig') end,
        dependencies = {
            -- Automatically install LSPs to stdpath for neovim
            { 'williamboman/mason.nvim' },
            'williamboman/mason-lspconfig.nvim',

            -- Useful status updates for LSP
            -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
            { 'j-hui/fidget.nvim',      opts = {} },

            -- Additional lua configuration, makes nvim stuff amazing!
            'folke/neodev.nvim',

            -- prettier
            { 'MunifTanjim/prettier.nvim',
                config = function() require('config/prettier') end,
                dependencies = {
                    -- make non-lsp systems work with LSP
                    'jose-elias-alvarez/null-ls.nvim',
                    config = function() require('config/null-ls') end,
                }
            },

            -- LSP UI
            {
                'glepnir/lspsaga.nvim',
                config = function() require('config/lspsaga') end,
                dependencies = {
                    { "nvim-tree/nvim-web-devicons" },
                    --Please make sure you install markdown and markdown_inline parser
                    { "nvim-treesitter/nvim-treesitter" }
                }
            }
        },
    },

    { -- Autocompletion
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        config = function() require('config/cmp') end,
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
    { 'folke/which-key.nvim', lazy = false, opts = {}, config = function()
      require('config/which-key')
    end },

    -- Theme
    { 'EdenEast/nightfox.nvim', config = function() require('config/nightfox') end },
    { 'folke/tokyonight.nvim',  config = function() require('config/tokyonight') end },

    { -- Set lualine as statusline
        'nvim-lualine/lualine.nvim',
        lazy = false,
        -- See `:help lualine.txt`
        config = function() require('config/lualine') end,
    },

    { -- Tab
        'akinsho/bufferline.nvim',
        event = 'VeryLazy',
        config = function() require('config/bufferline') end,
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },

    -- Fuzzy Finder (files, lsp, etc)
    { 'nvim-telescope/telescope.nvim', event = 'VeryLazy', config = function() require('config/telescope') end, version = '*', dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-file-browser.nvim', -- Fuzzy Finder Algorithm which requires local dependencies to be built.
        -- Only load if `make` is available. Make sure you have the system
        -- requirements installed.
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            -- NOTE: If you are having trouble with this installation,
            --       refer to the README for telescope-fzf-native for more instructions.
            build = 'make',
            cond = function()
              return vim.fn.executable 'make' == 1
            end,
        }, } },


    -- Zettelkasten with telescope
    {
        'renerocksai/telekasten.nvim',
        event = 'VeryLazy',
        config = function() require('config/telekasten') end,
        dependencies = { 'nvim-telescope/telescope.nvim', 'renerocksai/calendar-vim' }
    },

    { -- Highlight, edit, and navigate code
        -- When you see some erros, try `:cheackhelath nvim-treesitter`, and `:TSInstall! <lang-name>`
        'nvim-treesitter/nvim-treesitter',
        event = 'VeryLazy',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        config = function()
          pcall(require('nvim-treesitter.install').update { with_sync = true })
          require('config/treesitter')
        end,
    },
    -- adds indentation guides to all lines (including empty lines)
    { "lukas-reineke/indent-blankline.nvim", event = 'CursorHold',  config = function() require('config/blankline') end },
    { -- EasyMotion
        'phaazon/hop.nvim',
        event = 'CursorHold',
        config = function() require('config/hop') end,
        branch = 'v2', -- optional but strongly recommended
    },

    -- GitHub Copilot
    -- It needs tab key is not mapped by other plugins
    { 'github/copilot.vim',                  event = 'InsertEnter' },

    -- Display a number of serach results
    { 'kevinhwang91/nvim-hlslens',           event = 'CursorHold',  config = function() require('config/hlslens') end },

    -- Awesome autopair plugin
    { 'windwp/nvim-autopairs',               event = 'InsertEnter', config = function() require('config/autopairs') end },
    -- Also autopair for html tags
    { 'windwp/nvim-ts-autotag',              event = 'InsertEnter', config = function() require('config/ts-autotag') end },

    -- Adds git releated signs to the gutter, as well as utilities for managing changes
    { 'lewis6991/gitsigns.nvim',             event = 'CursorHold',  config = function() require('config/gitsigns') end },

    -- Discord Rich Presence
    { 'andweeb/presence.nvim',               lazy = false,          config = function() require('config/presence') end },

    -- needs to install im-select
    { 'keaising/im-select.nvim',             event = 'InsertEnter', config = function() require('config/im-select') end },
}, {})
