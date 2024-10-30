local plugins = {}

local config_files = {
  "code",
  "dap",
  "editor",
  "lang",
  "markdown",
  "neotest",
  "python",
  "sql",
  "obsidian",
}

for _, file in ipairs(config_files) do
  local plugin = require("plugins.custome." .. file)
  table.insert(plugins, plugin)
end

return plugins
