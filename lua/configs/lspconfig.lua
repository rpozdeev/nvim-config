local nvlsp = require "nvchad.configs.lspconfig"
local lspconfig = require "lspconfig"
nvlsp.defaults()

-- Отключение виртуального текста для предупреждений
vim.diagnostic.config {
  virtual_text = false, -- Отключить виртуальный текст диагностики
  -- virtual_text = {
  --   prefix = '●', -- Префикс для виртуального текста диагностики
  -- },
  signs = true, -- Включить отображение знаков
  update_in_insert = true, -- Обновлять диагностику в режиме INSERT
  underline = true, -- Подчеркивать проблемные участки кода
}
-- Настройка значков диагностики
vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "ℹ", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })

-- Всплывающее окно диагностики
vim.keymap.set("n", "<leader>do", "<cmd>lua vim.diagnostic.open_float()<CR>", { desc = "diagnosti float" })
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false, scope = "cursor" })
  end,
})

-- список серверов с конфигурацией по умолчанию
local servers = {
  "dockerls",
  "docker_compose_language_service",
  "ansiblels",
  "marksman",
}

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

lspconfig.terraformls.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  filetypes = { "terraform", "tf", "hcl" },
}

lspconfig.pyright.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,

  settings = {
    python = {
      analysis = {
        typeCheckingMode = "off", -- Disable type checking diagnostics
      },
    },
  },
}

lspconfig.yamlls.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = {
    textDocument = {
      foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      },
    },
  },
  on_new_config = function(new_config)
    new_config.settings.yaml.schemas =
      vim.tbl_deep_extend("force", new_config.settings.yaml.schemas or {}, require("schemastore").yaml.schemas())
  end,
  settings = {
    redhat = { telemetry = { enabled = false } },
    yaml = {
      keyOrdering = false,
      format = {
        enable = true,
      },
      validate = true,
      schemaStore = {
        -- Must disable built-in schemaStore support to use
        -- schemas from SchemaStore.nvim plugin
        enable = false,
        -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
        url = "",
      },
    },
  },
}

lspconfig.helm_ls.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  settings = {
    ["helm-ls"] = {
      yamlls = {
        path = "yaml-language-server",
      },
    },
  },
}

-- lspconfig.docker_compose_language_service.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   filetypes = { "docker-compose.yaml", "docker-compose.yml" },
-- }

lspconfig.jsonls.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  on_new_config = function(new_config)
    new_config.settings.json.schemas = new_config.settings.json.schemas or {}
    vim.list_extend(new_config.settings.json.schemas, require("schemastore").json.schemas())
  end,
  settings = {
    json = {
      format = {
        enable = true,
      },
      validate = { enable = true },
    },
  },
}

lspconfig.sqls.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,

  settings = {
    -- sqls = {
    --   connections = {
    --     {
    --       driver = "postgresql",
    --       dataSourceName = "host=localhost port=5432 user=your_user dbname=your_db sslmode=disable",
    --     },
    --     {
    --       driver = "mysql",
    --       dataSourceName = "your_user:your_password@tcp(127.0.0.1:3306)/your_db",
    --     },
    --   },
    -- },
  },
}

lspconfig.lua_ls.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,

  settings = {
    Lua = {
      diagnostics = {
        enable = false, -- отключаем диагностику для lua_ls
        -- globals = { "vim" },
      },
      workspace = {
        library = {
          vim.fn.expand "$VIMRUNTIME/lua",
          vim.fn.expand "$VIMRUNTIME/lua/vim/lsp",
          vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types",
          vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy",
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    },
  },
}
