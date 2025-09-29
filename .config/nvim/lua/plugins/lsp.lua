return {
    "neovim/nvim-lspconfig",
    config = function()
        local mason = require("mason")
        local lspconfig = require("lspconfig")
        local mason_lspconfig = require("mason-lspconfig")
        local on_attach = function(_, bufnr)
            vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
                vim.lsp.buf.format()
            end, { desc = 'Format current buffer with LSP' })
        end

        local exist_file = function(directory)
            return directory(vim.api.nvim_buf_get_name(0)) ~= nil
        end

        vim.lsp.config('*', {
            capabilities = require('cmp_nvim_lsp').default_capabilities(),
        })
        vim.lsp.config("lua_ls", {
            settings = {
                Lua = {
                    workspace = { checkThirdParty = false },
                    telemetry = { enable = false },
                },
            },
        })
        vim.lsp.config("ts_ls", {
            root_dir = lspconfig.util.root_pattern("package.json"),
        })
        vim.lsp.config("denols", {
            single_file_support = function()
                if not exist_file("deno.json") and not exist_file("deno.jsonc") then
                    return true
                else
                    return false
                end
            end,
            root_dir = function()
                if exist_file("deno.json") then
                    return lspconfig.util.root_pattern("deno.json")
                elseif exist_file("deno.jsonc") then
                    return lspconfig.util.root_pattern("deno.jsonc")
                else
                    return lspconfig.util.root_pattern(nil)
                end
            end,
            settings = {
                deno = {
                    lint = true,
                    unstable = true,
                    suggest = {
                        imports = {
                            hosts = {
                                ["https://deno.land"] = true,
                                ["https://cdn.nest.land"] = true,
                                ["https://crux.land"] = true,
                            }
                        }
                    }
                }
            }
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
