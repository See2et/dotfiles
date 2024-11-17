return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = {
          "markdown",
          "markdown_inline",
          "lua"
        },
        highlight = {
          enable = true,
          auto_install = true,
        },
        indent = {
          enable = true,
        },
        autotag = {
          enable = true,
        }
      }
    end,
    dependencies = { "windwp/nvim-ts-autotag", "nvim-treesitter/playground" },
  },
}
