return {
  "neovim/nvim-lspconfig",
  event = "BufReadPre",
  config = function()
    require("neodev").setup()
    require("mason").setup()
    require("mason-null-ls").setup {
      automatic_setup = true,
    }
    require("null-ls").setup {}
    local mason_lsp = require("mason-lspconfig")
    local servers = {
      lua_ls = {
        Lua = {
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
        },
      },
    }
    mason_lsp.setup {
      ensure_installed = vim.tbl_keys(servers),
    }
    local nvim_lsp = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local on_attach = function(_, bufnr)
      vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
      end, { desc = 'Format current buffer with LSP' })
    end
    mason_lsp.setup_handlers {
      function(server)
        local opt = {}
        opt.on_attach = on_attach
        opt.capabilities = capabilities
        opt.settings = servers[server]
        nvim_lsp[server].setup { opt }
      end
    }
    require("lspsaga").setup {
      ui = {
        theme = "round",
        winblend = 0,
        border = "double",
        colors = {
          normal_bg = ""
        }
      }
    }
  end,
  dependencies = {
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    {
      "jay-babu/mason-null-ls.nvim",
      dependencies = {
        "jose-elias-alvarez/null-ls.nvim",
      },
    },
    {
      "glepnir/lspsaga.nvim",
      cmd = "Lspsaga",
      dependencies = {
        -- "nvim-tree/nvim-web-devicons",
        -- Please make sure you install markdown and markdown_inline parser
        "nvim-treesitter/nvim-treesitter"
      }
    },
    {
      "folke/neodev.nvim",
      ft = "lua"
    },
    {
      "hrsh7th/nvim-cmp",
      event = "InsertEnter",
      config = function()
        local cmp = require("cmp")
        cmp.setup({
          snippet = {
            expand = function(args)
              require("luasnip").lsp_expand(args.body)
            end,
          },
          mapping = cmp.mapping.preset.insert({
            ['<C-b>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.abort(),
            ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          }),
          sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'luasnip' },
          }),
          formatting = {
            format = require("lspkind").cmp_format({
              mode = 'symbol',       -- show only symbol annotations
              maxwidth = 50,         -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
              ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
            })
          }
        }, {
          { name = 'buffer' },
        })

        cmp.setup.cmdline({ '/', '?' }, {
          mapping = cmp.mapping.preset.cmdline(),
          sources = {
            { name = 'buffer' }
          }
        })

        cmp.setup.cmdline(':', {
          mapping = cmp.mapping.preset.cmdline(),
          sources = cmp.config.sources({
            { name = 'path' }
          }, {
            { name = 'cmdline' }
          })
        })
      end,
      dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "onsails/lspkind.nvim",
      }
    },
  }
}
