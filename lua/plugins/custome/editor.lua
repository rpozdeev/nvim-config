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
    opts = {
      modes = {
        char = {
          highlight = {
            backdrop = true, -- затемнение всего остального текста
            label = {
              after = true, -- показать метки после символа
              style = "inline", -- стиль меток
            },
          },
          jump = {
            autojump = true, -- автоматический переход на первый результат
          },
        },
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
