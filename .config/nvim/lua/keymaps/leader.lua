require("which-key").add({
    -- Code
    { "<leader>c",  group = "Code" },
    { "<leader>ca", "<cmd>Lspsaga code_action<cr>",                      desc = "[C]ode [A]ction" },

    -- Docs / Hover
    { "<leader>d",  "<cmd>Lspsaga hover_doc<cr>",                        desc = "Show [D]ocumentation" },

    -- Goto
    { "<leader>g",  group = "Goto" },
    { "<leader>gd", "<cmd>Lspsaga goto_definition<cr>",                  desc = "[G]oto [D]efinition" },

    -- LSP
    { "<leader>l",  group = "LSP" },
    { "<leader>lf", "<cmd>Lspsaga lsp_finder<cr>",                       desc = "[L]sp [F]inder" },

    -- Format
    { "<leader>f",  group = "Format" },
    { "<leader>fm", function() vim.lsp.buf.format({ async = true }) end, desc = "[F]or[m]at" },

    -- Open
    { "<leader>o",  group = "Open" },
    { "<leader>ot", "<cmd>terminal fish<cr>",                            desc = "[O]pen [T]erminal" },
    { "<leader>og", "<cmd>terminal lazygit<cr>",                         desc = "[O]pen [G]it" },
    {
        "<leader>of",
        function()
            require("telescope").extensions.file_browser.file_browser({
                path = "%:p:h",
                cwd = vim.fn.expand("%:p:h"),
                respect_gitignore = false,
                hidden = true,
                grouped = true,
                initial_mode = "normal",
                layout_config = { height = 40 },
            })
        end,
        desc = "[O]pen [F]ile Browser"
    },

    -- Peek
    { "<leader>p",  group = "Peek" },
    { "<leader>pd", "<cmd>Lspsaga peek_definition<cr>",                        desc = "[P]eek [D]efinition" },

    -- Quit / Write
    { "<leader>q",  "<cmd>q!<cr>",                                             desc = "[Q]uit" },
    { "<leader>w",  "<cmd>w<cr>",                                              desc = ":[w]" },

    -- Rename
    { "<leader>r",  group = "Rename" },
    { "<leader>rn", "<cmd>Lspsaga rename<cr>",                                 desc = "[R]e[n]ame" },

    -- Show / Source
    { "<leader>s",  group = "Show/Source" },
    { "<leader>sd", "<cmd>Lspsaga show_line_diagnostics<cr>",                  desc = "[S]how Line [D]iagnostics" },
    { "<leader>so", "<cmd>so<cr>",                                             desc = ":so" },

    -- グループ見出し
    { ";",          group = "Fuzzy / Tools" },

    -- もともと [";"] = "/" だったやつは ";;" になる
    { ";;",         "/",                                                       desc = "[;] Search" },

    -- Telescope 系
    { ";d",         function() require("telescope.builtin").diagnostics() end, desc = "[;] Fuzzy [D]iagnostics" },
    { ";f",         function() require("telescope.builtin").find_files() end,  desc = "[;] Fuzzy [F]iles" },
    { ";g",         function() require("telescope.builtin").live_grep() end,   desc = "[;] Fuzzy by [G]rep" },
    { ";h",         function() require("telescope.builtin").help_tags() end,   desc = "[;] Fuzzy [H]elp" },
    { ";s",         function() require("telescope.builtin").grep_string() end, desc = "[;] Fuzzy [S]tring" },
    { ";r",         function() require("telescope.builtin").oldfiles() end,    desc = "[;] Fuzzy [R]ecently" },
    { ";e",         function() require("telescope.builtin").buffers() end,     desc = "[;] Fuzzy [E]xisting" },
    {
        ";c",
        function()
            require("telescope.builtin").current_buffer_fuzzy_find(
                require("telescope.themes").get_dropdown({ previewer = false })
            )
        end,
        desc = "[;] Fuzzy [C]urrent"
    },

    -- その他トグル系
    { ";n", "<cmd>Telescope noice<cr>", desc = "[;] Fuzzy [N]oice" },
    { ";t", "<cmd>ToggleTerm<cr>",      desc = "[;] Toggle [T]erm" },
    { ";z", "<cmd>ZenMode<cr>",         desc = "[;] Toggle [Z]enMode" },
})
