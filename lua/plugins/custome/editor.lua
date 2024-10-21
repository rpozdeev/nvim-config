return {
  {
    "stevearc/oil.nvim",
    opts = {
      columns = {
        "icon",
        "permissions",
        "size",
        "mtime",
      },
    },
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    keys = {
      { "<leader>o", "<cmd>Oil --float<cr>", {} },
    },
  },
  {
    "christoomey/vim-tmux-navigator",
    event = "VimEnter",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    -- keys = {
    --   { "<C-h>", "<cmd>TmuxNavigateLeft<cr>" },
    --   { "<C-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
    --   { "<C-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
    --   { "<C-l>", "<cmd>TmuxNavigateRight<cr>" },
    --   { "<C-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    -- },
  },
  {
    -- автоматическое закрытие скобок
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup {
        disable_filetype = { "TelescopePrompt", "vim" },
      }
    end,
  },
  {
    "stevearc/dressing.nvim",
    event = "VimEnter",
    opts = {},
    config = function()
      require("dressing").setup()
    end,
  },
  {
    "kylechui/nvim-surround",
    event = { "BufReadPre", "BufNewFile" },
    tag = "v2.3.0", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    vscode = true,
    ---@type Flash.Config
    opts = {},
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "o", "x" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
      {
        "r",
        mode = "o",
        function()
          require("flash").remote()
        end,
        desc = "Remote Flash",
      },
      {
        "R",
        mode = { "o", "x" },
        function()
          require("flash").treesitter_search()
        end,
        desc = "Treesitter Search",
      },
      {
        "<c-s>",
        mode = { "c" },
        function()
          require("flash").toggle()
        end,
        desc = "Toggle Flash Search",
      },
    },
  },
  { "sindrets/diffview.nvim", event = "VeryLazy" },
  {
    {
      "keaising/im-select.nvim",
      event = "VimEnter",
      config = function()
        require("im_select").setup {
          default_command = "im-select",
        }
      end,
    },
  },
  {
    "folke/todo-comments.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
    keys = {
      {
        "]t",
        function()
          require("todo-comments").jump_next()
        end,
        desc = "Next Todo Comment",
      },
      {
        "[t",
        function()
          require("todo-comments").jump_prev()
        end,
        desc = "Previous Todo Comment",
      },
      { "<leader>tt", "<cmd>Trouble todo toggle<cr>", desc = "Todo (Trouble)" },
      {
        "<leader>tT",
        "<cmd>Trouble todo toggle filter = {tag = {TODO,FIX,FIXME}}<cr>",
        desc = "Todo/Fix/Fixme (Trouble)",
      },
      { "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Todo" },
      { "<leader>fT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme" },
    },
  },
}
