return {
    root_dir = function(bufnr, callback)
        local found_dirs = vim.fs.find({
            'deno.json',
            'deno.jsonc',
            'deps.ts',
        }, {
            upward = true,
            path = vim.fs.dirname(vim.fs.normalize(vim.api.nvim_buf_get_name(bufnr))),
        })
        if #found_dirs > 0 then
            return callback(vim.fs.dirname(found_dirs[1]))
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
}
