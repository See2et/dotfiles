local status, packer = pcall(require, 'packer')
if not status then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim' -- Package Manager Itsself
  use {
    'svrana/neosolarized.nvim',
    requires = { 'tjdevries/colorbuddy.nvim' }
  } -- One of the color schemes
  use { "catppuccin/nvim", as = "catppuccin" } -- Another color scheme
  -- ToDo: 反映されない
  use 'kyazdani42/nvim-web-devicons' -- File icons
  use 'glepnir/lspsaga.nvim' -- LSP UIs
  use 'L3MON4D3/LuaSnip' -- Snipet
  use 'hoob3rt/lualine.nvim' -- Statusline
  use 'folke/lsp-colors.nvim' -- LSP colors
  use 'onsails/lspkind-nvim' -- vscode-lie pictograms
  use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp sourcefor neovim's built-in LSP
  use 'hrsh7th/nvim-cmp' -- Completion
  use 'neovim/nvim-lspconfig' -- LSP
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'nvim-treesitter/nvim-treesitter-context' -- Show function name above when it's large
  use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a lanuage server to inject LSP diagnostics, code actions, and more via LuaSnip
  use 'MunifTanjim/prettier.nvim' -- Pritter plugin for Neovim's built-in
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'
  use 'akinsho/toggleterm.nvim' -- Terminal
  use 'terrortylor/nvim-comment' -- Toggle Comment
  use 'phaazon/hop.nvim' -- Easy motion
  use 'yutkat/wb-only-current-line.vim' -- wb in only current line

  use 'nvim-lua/plenary.nvim' -- Common utilities
  -- brew install ripgrep
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'
  -- Telekasten ~
  use 'renerocksai/telekasten.nvim'
  use 'renerocksai/calendar-vim'
  use 'nvim-telescope/telescope-media-files.nvim'
  -- ~ Telekasten

  use 'akinsho/bufferline.nvim'
  use 'norcalli/nvim-colorizer.lua'

  use 'lewis6991/gitsigns.nvim'

  use 'andweeb/presence.nvim' -- Discord Rich Presence

  use 'github/copilot.vim' -- GitHub Copilot

  use 'vim-denops/denops.vim' -- Denops
  use { 'Allianaab2m/vimskey', branch = 'dev' } -- VimSkey'

  use 'kevinhwang91/nvim-hlslens' -- Display a number of search results

  use 'MunifTanjim/nui.nvim'
  use 'VonHeikemen/fine-cmdline.nvim' -- Floating command line

  -- ToDo: 「エディタのコマンドではありません」というエラーが出る
  use {'krivahtoo/silicon.nvim', run = './install.sh'} -- Make a picture of selected code

  use 'RRethy/vim-illuminate' -- Highlight other uses of the word under the cursor
  use 'sidebar-nvim/sidebar.nvim' -- Show diagnostics, symbols and so on in the sidebar
end)
