function fn_docker_compose()
  local filename = vim.fn.expand "%:t"

  if filename == "docker-compose.yaml" then
    vim.bo.filetype = "yaml.docker-compose"
  end
end

vim.cmd [[au BufRead * lua fn_docker_compose()]]
