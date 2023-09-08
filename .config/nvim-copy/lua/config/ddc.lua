vim.fn["ddc#custom#patch_global"]('ui', 'pum')

vim.fn["ddc#custom#patch_global"]('sources', {'nvim-lsp', 'around', 'skkeleton'})

vim.fn["ddc#custom#patch_global"]('sourceOptions', {
  _ = {
    matchers = {'matcher_fuzzy'},
    sorters = {'sorter_fuzzy'},
    converters = {'converter_fuzzy'}
  },
  around = {
    mark = 'Around'
  },
  ['nvim-lsp'] = {
    mark = 'Lsp',
    forceCompletionPattern = [[\.\w*|:\w*|->\w*]]
  },
  skkeleton = {
    mark = 'Skkelton',
    matchers = {"skkeleton"},
    minAutoCompleteLength = "2"
  }
})

vim.fn["ddc#enable"]()

vim.fn["signature_help#enable"]()
vim.fn["popup_preview#enable"]()

vim.keymap.set("i", "<C-n>", "<cmd>call pum#map#insert_relative(+1)<cr>")
vim.keymap.set("i", "<C-p>", "<cmd>call pum#map#insert_relative(-1)<cr>")
vim.keymap.set("i", "<C-y>", "<cmd>call pum#map#confirm()<cr>")
