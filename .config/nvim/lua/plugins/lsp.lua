return {
    "neovim/nvim-lspconfig",
    config = function()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")

        vim.lsp.config('*', {
            capabilities = require('cmp_nvim_lsp').default_capabilities(),
        })

        local servers = {
            "lua_ls",
            "ts_ls",
            "denols",
            "omnisharp",
            "rust_analyzer",
            "taplo",
            "tinymist"
        }

        mason.setup()
        mason_lspconfig.setup({
            automatic_enable = true,
            ensure_installed = servers
        })

        vim.lsp.enable(servers)
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
            config = function()
                require("lspsaga").setup {
                    ui = {
                        theme = "round",
                        winblend = 0,
                        border = "double",
                        colors = {
                            normal_bg = ""
                        },
                    },
                    lightbulb = {
                        sign = false
                    }
                }
            end,
            dependencies = {
                -- "nvim-tree/nvim-web-devicons",
                -- Please make sure you install markdown and markdown_inline parser
                "nvim-treesitter/nvim-treesitter"
            }
        },
        {
            {
                "folke/lazydev.nvim",
                ft = "lua",
                opts = {
                    library = {
                        "lazy.nvim"
                    },
                },
            },
        },
        {
            "hrsh7th/nvim-cmp",
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
        }
    }
}
