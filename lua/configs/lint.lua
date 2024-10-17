local lint = require "lint"

lint.linters_by_ft = {
  lua = { "luacheck" },
  python = { "mypy", "ruff" },
  terraform = { "tflint" },
  tf = { "tflint" },
}

lint.linters.luacheck.args = {
  "--globals",
  "vim",
  "--formatter",
  "plain",
  "--codes",
  "--ranges",
  "-",
}

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
  callback = function()
    lint.try_lint()
  end,
})
