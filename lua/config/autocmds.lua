-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua

--- set_filetype({ "docker-compose.yml" }, "yaml.docker-compose")
function docker_fix()
  local filename = vim.fn.expand("%:t")

  if filename == "docker-compose.yaml" then
    vim.bo.filetype = "yaml.docker-compose"
    print("matched!")
  else
    print(filename)
  end
end

vim.cmd([[au BufRead * lua docker_fix()]])
