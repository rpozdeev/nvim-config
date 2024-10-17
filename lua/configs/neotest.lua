require("neotest").setup {
  adapters = {
    require "neotest-python" {
      dap = { justMyCode = false }, -- Использовать nvim-dap для отладки тестов
      runner = "pytest", -- Укажите тестовый фреймворк (например, pytest)
    },
    require "neotest-plenary",
    require "neotest-vim-test" {
      ignore_file_types = { "python", "vim", "lua" },
    },
  },
}
-- vim.keymap.set("n", "<leader>tn", "<cmd>lua require('neotest').run.run()<cr>", { desc = "Run nearest test" })
-- vim.keymap.set(
--   "n",
--   "<leader>tf",
--   "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>",
--   { desc = "Run tests in file" }
-- )
-- vim.keymap.set("n", "<leader>ts", "<cmd>lua require('neotest').summary.toggle()<cr>", { desc = "Toggle test summary" })
-- vim.keymap.set(
--   "n",
--   "<leader>to",
--   "<cmd>lua require('neotest').output.open({ enter = true })<cr>",
--   { desc = "Show test output" }
-- )
--
-- vim.keymap.set("n", "<leader>tS", "<cmd>lua require('neotest').run.stop()<cr>", { desc = "Stop running tests" })
