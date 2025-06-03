local M = {}

---@param plugin_name string
function M.opts(plugin_name)
  local plugin = require('lazy.core.config').spec.plugins[plugin_name]
  if not plugin then
    return {}
  end
  local Plugin = require('lazy.core.plugin')
  return Plugin.values(plugin, 'opts', false)
end

function M.lsp_servers()
  local config_root = vim.fn.stdpath('config') .. '/lsp'
  local files = vim.fn.readdir(config_root)
  local names = {}

  for _, file in ipairs(files) do
    if file:sub(-4) == '.lua' then
      table.insert(names, file:sub(1, -5)) -- remove `.lua`
    end
  end

  return names
end
return M
