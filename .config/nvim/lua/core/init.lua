require("core.options") -- load core options
--require("core.theme") -- custom theme

local utils = require("core.utils")

utils.lazy_load({ "core.keymaps", "core.diagnostics", "core.autocmds" })
