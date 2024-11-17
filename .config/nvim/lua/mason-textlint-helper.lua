--==============================================================================
-- mason textlint helper module
--==============================================================================

local install_textlint_modules = {
  "textlint-rule-preset-japanese",
  "textlint-rule-preset-ja-technical-writing",
  "textlint-filter-rule-allowlist",
  "textlint-filter-rule-comments",
}

local M = {}

-------------------------------------------------------------------------------
-- Alias and Derivied Variables
-------------------------------------------------------------------------------

local vim = vim
local tunpack = table.unpack or _G.unpack
local uv = vim.loop
local inspect = vim.inspect
local path_separator = package.config:sub(1, 1)
local is_windows = vim.fn.has('win32') == 1
local data_path = vim.fn.stdpath('data')

-- MEMO: Within libuv on Windows, PATH is resolved independently, and CreateProcessW API is called.
-- It seems that it does not automatically append the '.cmd' extension according to PATHEXT.
-- see: https://github.com/libuv/libuv/blob/v1.x/src/win/process.c#L290-L299
local textlint_bin = is_windows and 'textlint.cmd' or 'textlint'
local npm_bin = is_windows and 'npm.cmd' or 'npm'

-------------------------------------------------------------------------------
-- Helper Functions
-------------------------------------------------------------------------------

local function build_msg(...)
  local msg = ''
  local n = select('#', ...)

  for i, v in ipairs({ ... }) do
    if type(v) == 'table' then
      msg = msg .. inspect(v)
    else
      msg = msg .. tostring(v)
    end

    if i < n then
      msg = msg .. ' '
    end
  end

  return msg .. '\n'
end

local function status_err(...)
  vim.api.nvim_err_write(build_msg(...))
end

local function status_msg(...)
  vim.api.nvim_out_write(build_msg(...))
end

local normalize_path_separator = is_windows and function(path)
  return path:gsub('/', '\\')
end or function(path)
  return path:gsub('\\', '/')
end

-------------------------------------------------------------------------------
-- Module Private Functions
-------------------------------------------------------------------------------

-- Initialize textlint
-- @param root_dir string
local function init_textlint(root_dir)
  local opts = {
    args = { '--init' },
    cwd = root_dir
  }

  -- see luv-uv luv spawn
  -- https://github.com/luvit/luv/blob/master/docs.md#uvspawnpath-options-on_exit
  local handle, pid
  handle, pid = uv.spawn(textlint_bin, opts, function(code, signal)
    if code > 0 then
      vim.schedule(function() status_err('textlint init failed:', code, signal) end)
    else
      vim.schedule(function() status_msg('textlint init success') end)
    end
    uv.close(handle)
  end)

  if handle == nil then
    status_err('execute textlint failed:', pid)
  else
    status_msg('textlint init:', root_dir)
  end
end

-- traverse directory with check function.
-- if check function return true, return the directory.
-- if check function return false, continue to traverse.
-- @param dir string
-- @param check_function function
-- @return string|nil
local function traverse_to_root(dir, check_function)
  local next_dir = dir

  repeat
    dir = next_dir
    local result = check_function(dir)
    if result then return result end

    next_dir = vim.fn.fnamemodify(dir, ':h')
  until dir == next_dir

  return nil
end

-- install textlint modules
-- @param ... string
-- @return uv_process
local function install_packages(...)
  local cmd = npm_bin
  local num_packages = select('#', ...)

  if num_packages == 0 then
    return
  end

  local mason_textlint_path = normalize_path_separator(data_path .. '/mason/packages/textlint')

  local opts = {
    args = { "install", "--silent", "--save", ... },
    cwd = mason_textlint_path
  }

  local handle, pid
  handle, pid = vim.loop.spawn(cmd, opts, function(code, signal)
    if code > 0 then
      vim.schedule(function() status_err('textlint add package failed:', code, signal) end)
    else
      vim.schedule(function() status_msg('textlint add package success:', package) end)
    end
    uv.close(handle)
  end)

  if handle == nil then
    status_err('execute npm failed:', pid)
  else
    status_msg('textlint now installing:', ...)
  end

  return handle
end

-------------------------------------------------------------------------------
-- Module Public Functions
-------------------------------------------------------------------------------

-- search .textlintrc file from current buffer directory to root directory.
-- @return string
local SearchTextLintRC = function()
  local function endswith(str, ending)
    return ending == "" or str:sub(- #ending) == ending
  end

  local function exists(file)
    file = normalize_path_separator(file)
    return vim.fn.filereadable(file) == 1
  end

  local function check_textlintrc(path)
    path = path .. (endswith(path, path_separator) and '' or path_separator)
    local filelist = {
      path .. '.textlintrc',
      path .. '.textlintrc.js',
      path .. '.textlintrc.yaml',
      path .. '.textlintrc.yml',
      path .. '.textlintrc.json'
    }
    for _, file in ipairs(filelist) do
      if exists(file) then
        return file
      end
    end

    return ''
  end

  local dir = vim.fn.expand('%:p:h')

  return traverse_to_root(dir, check_textlintrc)
end

-- Initialize textlint - create .textlintrc.json file.
-- if root_dir is nil, use current buffer directory.
-- @param root_dir string
local function TextLintInit(root_dir)
  if root_dir == nil then
    root_dir = vim.fn.expand('%:p:h')
  end
  init_textlint(root_dir)
end

-- Install textlint modules
-- install modules are defined in `textlint_helper.lua` file.
-- @return uv_process
local function TextLintInstall()
  install_packages(tunpack(install_textlint_modules))
end

-- Add textlint package
-- @param ... string
-- @return uv_process
local function TextLintAddPackage(...)
  install_packages(...)
end

-- Edit .textlintrc file
-- if .textlintrc file not found, show error message.
local function TextLintEditConfig()
  local textlintrc = M.TextLintLSConfig or SearchTextLintRC()

  if textlintrc == '' then
    status_err('.textlintrc not found')
    return
  end

  vim.api.nvim_command('edit ' .. textlintrc)
end

-- Export

M.SearchTextLintRC = SearchTextLintRC
M.TextLintInit = TextLintInit
M.TextLintInstall = TextLintInstall
M.TextLintAddPackage = TextLintAddPackage
M.TextLintEditConfig = TextLintEditConfig
M.TextLintLSConfig = nil

return M
