vim.fn["ddu#custom#patch_global"]({
    ui = "ff",
    sources = {{
        name = "file_rec",
        params = {}
    }},
    sourceOptions = {
        _ = {
            matchers = {"matcher_substring"}
        }
    },
    kindOptions = {
        file = {
            defaultAction = "open"
        }
    },
    uiParams = {
        ff = {
            split = "floating",
            startFilter = "v:true"
        }
    }
})

vim.cmd([[
augroup ddu-ff
  autocmd FileType ddu-ff lua ddu_my_settings()
  autocmd FileType ddu-ff-filter lua ddu_filter_my_settings()
  autocmd FileType ddu-filer lua ddu_filer_my_settings()
augroup END
]])

---@diagnostic disable-next-line: unused-local, unused-function
local function ddu_my_settings()
  vim.keymap.set('n', '<CR>', "<Cmd>call ddu#ui#ff#do_action('itemAction')<CR>", { silent = true, noremap = true })
  vim.keymap.set('n', '<Space>', "<Cmd>call ddu#ui#ff#do_action('toggleSelectItem')<CR>", { silent = true, noremap = true })
  vim.keymap.set('n', 'i', "<Cmd>call ddu#ui#ff#do_action('openFilterWindow')<CR>", { silent = true, noremap = true })
  vim.keymap.set('n', 'q', "<Cmd>call ddu#ui#ff#do_action('quit')<CR>", { silent = true, noremap = true })
end

---@diagnostic disable-next-line: unused-local, unused-function
local function ddu_filter_my_settings()
  vim.keymap.set('i', '<CR>', "<Esc><Cmd>close<CR>", { silent = true, noremap = true })
  vim.keymap.set('n', '<CR>', "<Cmd>close<CR> ", { silent = true, noremap = true })
  vim.keymap.set('n', 'q', '<Cmd>close<CR>', { silent = true, noremap = true })
end

vim.fn["ddu#custom#patch_local"]('filer', {
    ui = "filer",
    sources = {
        {
            name = "file",
            params = {}
        }
    },
    sourceOptions = {
        _ = {
            columns = {"filename"}
        }
    },
    kindOptions = {
        file = {
            defaultAction = "open"
        }
    },
    uiParams = {
        filer = {
            winWidth = 40,
            split = "floating",
        }
    }
})

---@diagnostic disable-next-line: unused-local, unused-function
local function ddu_filer_my_settings()
    vim.keymap.set('n', '<CR>', '<Cmd>call ddu#ui#filer#do_action("itemAction")<CR>', { silent = true, noremap = true })
    vim.keymap.set('n', '<Space>', '<Cmd>call ddu#ui#filer#do_action("toggleSelectItem")<CR>', { silent = true, noremap = true })
    vim.keymap.set('n', 'o', '<Cmd>call ddu#ui#filer#do_action("expandItem", {"mode": "toggle"})<CR>', { silent = true, noremap = true })
    vim.keymap.set('n', 'q', '<Cmd>call ddu#ui#filer#do_action("quit")<CR>', { silent = true, noremap = true })
end
