return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    run = ":TSUpdate", -- Автоматическое обновление парсеров
    config = function()
      require "configs.treesitter"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require "configs.lint"
    end,
  },
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    config = function()
      require "configs.conform"
    end,
  },
  {
    "petertriho/cmp-git",
    event = "VeryLazy",
    dependencies = { "hrsh7th/nvim-cmp" },
    opts = {
      -- options go here
    },
    init = function()
      table.insert(require("cmp").get_config().sources, { name = "git" })
    end,
  },
  {
    "jcdickinson/codeium.nvim",
    event = "VimEnter",
    init = function()
      table.insert(require("cmp").get_config().sources, { name = "" })
      require("codeium").setup {}
    end,
  },
}
