-- LSP settings.
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
   -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
local servers = {
  -- tsserver = {},

  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}

-- Setup neovim lua configuration
local status, neodev = pcall(require, 'neodev')
if not status then print('neodev is not installed') return end
neodev.setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Setup mason so it can manage external tooling
local status2, mason = pcall(require, 'mason')
if not status2 then print('mason is not installed') return end
mason.setup()

-- Ensure the servers above are installed
local status3, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not status3 then print('mason-lspconfig') return end

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

local status4, nvim_lspconfig = pcall(require, 'lspconfig')
if not status4 then print('lspconfig is not installed') return end
local package_json_dir = nvim_lspconfig.util.root_pattern("package.json")
local exist_package_json = package_json_dir(vim.api.nvim_buf_get_name(0)) ~= nil
local deno_json_dir = nvim_lspconfig.util.root_pattern("deno.json")
local exist_deno_json = deno_json_dir(vim.api.nvim_buf_get_name(0)) ~= nil
local deno_jsonc_dir = nvim_lspconfig.util.root_pattern("deno.jsonc")
local exist_deno_jsonc = deno_jsonc_dir(vim.api.nvim_buf_get_name(0)) ~= nil
mason_lspconfig.setup_handlers {
  function(server_name)
    local opts = {}
    if server_name == 'tsserver' then
      if not exist_package_json then return end
      opts.root_dir = nvim_lspconfig.util.root_pattern("package.json")
      opts.cmd = { "typescript-language-server", "--stdio" }
      opts.single_file_support = false
    elseif server_name == 'eslint' then
      if not exist_package_json then return end
      opts.root_dir = nvim_lspconfig.util.root_pattern("package.json")
      opts.root_dir = nvim_lspconfig.util.root_pattern("package.json")
    elseif server_name == 'denols' then
      if exist_package_json then return end
      -- denoはdeno.jsonがなくても動くのでこのif文を書いてみてる
      if exist_deno_json then
        opts.root_dir = nvim_lspconfig.util.root_pattern("deno.json")
      elseif exist_deno_jsonc then
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
    opts.capabilities = capabilities
    opts.on_attach = on_attach
    opts.settings = servers[server_name]
    nvim_lspconfig[server_name].setup {opts}
  end,
}
