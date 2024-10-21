return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      require "configs.dap"
    end,
  },
  -- {
  --   "jay-babu/mason-nvim-dap.nvim",
  --   event = "VeryLazy",
  --   config = function()
  --     require("mason-nvim-dap").setup {
  --       ensure_installed = { "python" },
  --       automatic_installation = { exclude = {} },
  --     }
  --   end,
  -- },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    keys = {
      { "<leader>tn", "<cmd>lua require('neotest').run.run()<CR>", desc = "Run nearest test" },
      { "<leader>tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>", desc = "Run tests in file" },
      { "<leader>ts", "<cmd>lua require('neotest').summary.toggle()<CR>", desc = "Toggle test summary" },
      { "<leader>td", "<cmd>lua require('neotest').run.run({strategy = 'dap'})<CR>", desc = "Debug nearest test" },
      { "<leader>to", "<cmd>lua require('neotest').output.open({ enter = true })<CR>", desc = "Show test output" },
      { "<leader>tS", "<cmd>lua require('neotest').run.stop()<CR>", desc = "Stop running tests" },
    },
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"
      dapui.setup()

      local map = vim.keymap.set
      map("n", "<leader>du", "<cmd>lua require('dapui').toggle()<CR>", { desc = "Toggle DAP UI" })

      dap.listeners.after.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.after.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
    end,
  },
}
