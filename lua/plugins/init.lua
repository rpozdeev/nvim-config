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
    "williamboman/mason-lspconfig.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lspconfig" },
    config = function()
      require "configs.mason-lspconfig"
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
    "rshkarin/mason-nvim-lint",
    event = "VeryLazy",
    dependencies = { "nvim-lint" },
    config = function()
      require "configs.mason-lint"
    end,
  },
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    -- keys = {
    --   {
    --     "<leader>f",
    --     function()
    --       require("conform").format { async = true, lsp_format = "fallback" }
    --     end,
    --     mode = "",
    --     desc = "[F]ormat buffer",
    --   },
    -- },
    config = function()
      require "configs.conform"
    end,
  },
  {
    "zapling/mason-conform.nvim",
    event = "VeryLazy",
    dependencies = { "conform.nvim" },
    config = function()
      require "configs.mason-conform"
    end,
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      require "configs.dap"
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    config = function()
      require "configs.mason-dap"
    end,
  },
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
      require "configs.dap-ui"
    end,
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function()
      require "configs.dap-python"
    end,
  },
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
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
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
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      -- Адаптеры для Python и других языков
      "nvim-neotest/neotest-python",
      "nvim-neotest/neotest-plenary",
      "nvim-neotest/neotest-vim-test",
    },
    config = function()
      require "configs.neotest"
    end,
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
    "folke/todo-comments.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
  -- stylua: ignore
  keys = {
    { "]t", function() require("todo-comments").jump_next() end, desc = "Next Todo Comment" },
    { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous Todo Comment" },
    { "<leader>tt", "<cmd>Trouble todo toggle<cr>", desc = "Todo (Trouble)" },
    { "<leader>tT", "<cmd>Trouble todo toggle filter = {tag = {TODO,FIX,FIXME}}<cr>", desc = "Todo/Fix/Fixme (Trouble)" },
    { "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Todo" },
    { "<leader>fT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme" },
  },
  },
  {
    "linux-cultist/venv-selector.nvim",
    branch = "regexp", -- Use this branch for the new version
    cmd = "VenvSelect",
    opts = {
      settings = {
        options = {
          notify_user_on_venv_activation = true,
        },
      },
    },
    --  Call config for python files and load the cached venv automatically
    ft = "python",
    keys = { { "<leader>cv", "<cmd>:VenvSelect<cr>", desc = "Select VirtualEnv", ft = "python" } },
  },
  {
    "mfussenegger/nvim-ansible",
    ft = {},
    keys = {
      {
        "<leader>ta",
        function()
          require("ansible").run()
        end,
        desc = "Ansible Run Playbook/Role",
        silent = true,
      },
    },
  },
  {
    "cappyzawa/telescope-terraform.nvim",
    ft = "terraform",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("telescope").load_extension "terraform"
    end,
  },
  {
    "b0o/SchemaStore.nvim",
    lazy = true,
    version = false, -- last release is way too old
  },
  { "towolf/vim-helm", ft = "helm" },
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
  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
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
    {
      "iamcco/markdown-preview.nvim",
      cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
      build = function()
        require("lazy").load { plugins = { "markdown-preview.nvim" } }
        vim.fn["mkdp#util#install"]()
      end,
      keys = {
        {
          "<leader>cp",
          ft = "markdown",
          "<cmd>MarkdownPreviewToggle<cr>",
          desc = "Markdown Preview",
        },
      },
      config = function()
        vim.cmd [[do FileType]]
      end,
    },
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    event = { "BufReadPre", "BufNewFile" },
    ft = "markdown",
    keys = {
      {
        "<leader>cr",
        ft = "markdown",
        "<cmd>RenderMarkdown toggle<cr>",
        desc = "Markdown Render toggle",
      },
    },
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
      code = {
        sign = false,
        width = "block",
        right_pad = 1,
      },
      heading = {
        sign = false,
        icons = {},
      },
    },
  },
  -- sql
  {
    "tpope/vim-dadbod",
    cmd = "DB",
  },
  {
    "kristijanhusak/vim-dadbod-completion",
    dependencies = "vim-dadbod",
    ft = sql_ft,
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = sql_ft,
        callback = function()
          local cmp = require "cmp"

          -- global sources
          ---@param source cmp.SourceConfig
          local sources = vim.tbl_map(function(source)
            return { name = source.name }
          end, cmp.get_config().sources)

          -- add vim-dadbod-completion source
          table.insert(sources, { name = "vim-dadbod-completion" })

          -- update sources for the current buffer
          cmp.setup.buffer { sources = sources }
        end,
      })
    end,
  },
  {
    "kristijanhusak/vim-dadbod-ui",
    cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
    dependencies = "vim-dadbod",
    keys = {
      { "<leader>dD", "<cmd>DBUIToggle<CR>", desc = "Toggle DBUI" },
    },
    init = function()
      local data_path = vim.fn.stdpath "data"

      vim.g.db_ui_auto_execute_table_helpers = 1
      vim.g.db_ui_save_location = data_path .. "/dadbod_ui"
      vim.g.db_ui_show_database_icon = true
      vim.g.db_ui_tmp_query_location = data_path .. "/dadbod_ui/tmp"
      vim.g.db_ui_use_nerd_fonts = true
      vim.g.db_ui_use_nvim_notify = true

      -- NOTE: The default behavior of auto-execution of queries on save is disabled
      -- this is useful when you have a big query that you don't want to run every time
      -- you save the file running those queries can crash neovim to run use the
      -- default keymap: <leader>S
      vim.g.db_ui_execute_on_save = false
    end,
  },
}
