local status, mason = pcall(require, 'mason')
if not status then return end
mason.setup()

local status2, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not status2 then return end
local status3, nvim_lspconfig = pcall(require, 'lspconfig')
if not status3 then return end
local status4, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not status4 then return end
mason_lspconfig.setup_handlers({ function(server)
  local opts = {}
  opts.capabilities = cmp_nvim_lsp.default_capabilities()

  local package_json_dir = nvim_lspconfig.util.root_pattern("package.json")
  local exist_package_json = package_json_dir(vim.api.nvim_buf_get_name(0)) ~= nil
  local deno_json_dir = nvim_lspconfig.util.root_pattern("deno.json")
  local exist_deno_json = deno_json_dir(vim.api.nvim_buf_get_name(0)) ~= nil
  local deno_jsonc_dir = nvim_lspconfig.util.root_pattern("deno.jsonc")
  local exist_deno_jsonc = deno_jsonc_dir(vim.api.nvim_buf_get_name(0)) ~= nil


  if server == 'tsserver' then
    if not exist_package_json then return end
    opts.root_dir = nvim_lspconfig.util.root_pattern("package.json")
    opts.cmd = { "typescript-language-server", "--stdio" }
    opts.single_file_support = false
  elseif server == 'eslint' then
    if not exist_package_json then return end
    opts.root_dir = nvim_lspconfig.util.root_pattern("package.json")
    opts.root_dir = nvim_lspconfig.util.root_pattern("package.json")
  elseif server == 'denols' then
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
  elseif server == 'sumneko_lua' then
    opts.settings = {
		  Lua = {
		    diagnostics = {
			    -- Get the language server to recognize the 'vim' global
			    globals = { 'vim' }
		    },
		    workspace = {
				    -- Make the server aware of Neovim runtime files
			    libarary = vim.api.nvim_get_runtime_file("", true),
			    checkThirdParty = false
		    }
		  }
	  }
  elseif server == 'rust_analyzer' then
    opts.cmd = {'rust_analyzer'}
  elseif server == 'marksman' then
    opts.cmd = {'marksman'}
  end
  nvim_lspconfig[server].setup(opts)
end })

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
 	update_in_insert = false,
	virtual_text = {
		format = function(diagnostic)
			return string.format("%s (%s: %s)", diagnostic.message, diagnostic.source, diagnostic.code)
		end,
	},
 })
