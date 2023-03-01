local status, null_ls = pcall(require, 'null-ls')
if not status then print('null-ls is not installed') return end

null_ls.setup({
  sources = {
    -- null_ls.builtins.diagnostics.eslint.with({
    --   diagnostics_format = '[eslint] #{m}\n(#{c})'
    -- }),
    -- null_ls.builtins.code_actions.eslint,
    -- null_ls.builtins.formatting.prettier,
    null_ls.builtins.diagnostics.fish,
  }
})
