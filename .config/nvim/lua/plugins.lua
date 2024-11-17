require('lazy').setup {
  { "folke/lazy.nvim" },
  {
    "folke/tokyonight.nvim",
    config = function()
      require('tokyonight').setup {
        transparent = true,
        styles = {
          floats = 'transparent',
        }
      }
    end
  },
  require("plugins.lsp"),
  require("plugins.misc"),
  require("plugins.ts")
}
