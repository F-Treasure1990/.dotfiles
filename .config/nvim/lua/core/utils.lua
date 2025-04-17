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

return M
