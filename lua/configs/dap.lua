local map = vim.keymap.set
map("n", "<leader>d", "", { desc = "+debug" })
map("n", "<F5>", "<cmd>lua require('dap').continue()<cr>", { desc = "DAP continue" })
map("n", "da", "<cmd>lua require('dap').continue()<cr>", { desc = "DAP continue" })
map("n", "<leader>da", "<cmd>lua require('dap').continue({ before = get_args })<cr>", { desc = "DAP Run with Args" })
map("n", "<leader>dC", "<cmd>lua require('dap').run_to_cursor()<cr>", { desc = "DAP Run to Cursor" })
map("n", "<F10>", "<cmd>lua require('dap').step_over()<cr>", { desc = "DAP step over" })
map("n", "dO", "<cmd>lua require('dap').step_over()<cr>", { desc = "DAP step over" })
map("n", "<F11>", "<cmd>lua require('dap').step_into()<cr>", { desc = "DAP step into" })
map("n", "di", "<cmd>lua require('dap').step_into()<cr>", { desc = "DAP step into" })
map("n", "<F12>", "<cmd>lua require('dap').step_out()<cr>", { desc = "DAP step out" })
map("n", "do", "<cmd>lua require('dap').step_out()<cr>", { desc = "DAP step out" })
map("n", "<leader>dj", "<cmd>lua require('dap').down() <cr>", { desc = "Down" })
map("n", "<leader>dk", "<cmd>lua require('dap').up() <cr>", { desc = "Up" })
map("n", "<leader>dp", "<cmd>lua require('dap').pause() <cr>", { desc = "Pause" })
map("n", "<leader>ds", "<cmd>lua require('dap').session() <cr>", { desc = "Session" })
map("n", "<leader>dt", "<cmd>lua require('dap').terminate() <cr>", { desc = "Terminate" })
map("n", "<Leader>db", "<cmd>lua require('dap').toggle_breakpoint()<cr>", { desc = "DAP togglebreakpoint" })
map("n", "<Leader>dB", "<cmd>lua require('dap').set_breakpoint()<cr>", { desc = "DAP set breakpoint" })
map(
  "n",
  "<Leader>lp",
  "<cmd>lua require('dap').set_breakpoint(nil, nil, vim.fn.input 'Log point message: ')<cr>",
  { desc = "DAP log point" }
)
map("n", "<Leader>dr", "<cmd>lua require('dap').repl.open()<cr>", { desc = "DAP repl open" })
map("n", "<Leader>dl", "<cmd>lua require('dap').run_last()<cr>", { desc = "DAP run last" })
map({ "n", "v" }, "<Leader>dh", "<cmd>lua require('dap.ui.widgets').hover()<cr>", { desc = "DAP hover" })
map({ "n", "v" }, "<Leader>dp", "<cmd>lua require('dap.ui.widgets').preview()<cr>", { desc = "DAP preview" })
map("n", "<Leader>df", function()
  local widgets = require "dap.ui.widgets"
  widgets.centered_float(widgets.frames)
end, { desc = "DAP widgets frames" })
map("n", "<Leader>dg", function()
  local widgets = require "dap.ui.widgets"
  widgets.centered_float(widgets.scopes)
end, { desc = "DAP widgets scopes" })

-- Настройка иконок для точек останова в nvim-dap
vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DapBreakpoint", linehl = "", numhl = "" })
vim.fn.sign_define(
  "DapBreakpointCondition",
  { text = "", texthl = "DapBreakpointCondition", linehl = "", numhl = "" }
)
vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "DapBreakpointRejected", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "", texthl = "DapStopped", linehl = "DapStoppedLine", numhl = "" })
