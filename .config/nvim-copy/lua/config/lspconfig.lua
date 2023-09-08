local on_attach = function(_, bufnr)
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

local servers = {
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
      completion = {
        callSnippet = "Replace"
      }
    },
  },
}

local ad_call = function(name)
  local status, required = pcall(require, name)
  if not status then
    print(name .. 'is not installed')
    return
  end
  return required
end

ad_call('neodev').setup()
ad_call('mason').setup()
ad_call('mason-null-ls').setup({
  automatic_setup = true,
})
local null_ls = ad_call('null-ls')
null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prettier
  }
})
local mason_lspconfig = ad_call('mason-lspconfig')
mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}
local nvim_lspconfig = ad_call('lspconfig')

local exist_file = function(directory)
  return directory(vim.api.nvim_buf_get_name(0)) ~= nil
end

local package_json_dir = nvim_lspconfig.util.root_pattern("package.json")
local deno_json_dir = nvim_lspconfig.util.root_pattern("deno.json")
local deno_jsonc_dir = nvim_lspconfig.util.root_pattern("deno.jsonc")

mason_lspconfig.setup_handlers {
  function(server_name)
    local opts = {}
    if server_name == 'tsserver' then
      if not exist_file(package_json_dir) then return end
      opts.root_dir = nvim_lspconfig.util.root_pattern("package.json")
      opts.cmd = { "typescript-language-server", "--stdio" }
      opts.single_file_support = false
    elseif server_name == 'eslint' then
      if not exist_file(package_json_dir) then return end
      opts.root_dir = nvim_lspconfig.util.root_pattern("package.json")
    elseif server_name == 'denols' then
      if exist_file(package_json_dir) then return end
      -- denoはdeno.jsonがなくても動くのでこのif文を書いてみてる
      if exist_file(deno_json_dir) then
        opts.root_dir = nvim_lspconfig.util.root_pattern("deno.json")
      elseif exist_file(deno_jsonc_dir) then
        opts.root_dir = nvim_lspconfig.util.root_pattern("deno.jsonc")
      end
      opts.init_options = {
        lint = true,
        unstable = true,
        suggest = {
          imports = {
            hosts = {
              ["https://deno.land"] = true,
              ["https://cdn.nest.land"] = true,
              ["https://crux.land"] = true,
            },
          },
        },
      }
    end
    opts.on_attach = on_attach
    opts.settings = servers[server_name]
    nvim_lspconfig[server_name].setup { opts }
  end,
}
