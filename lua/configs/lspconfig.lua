local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

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

-- список серверов для конфигурации
lspconfig.servers = {
  "lua_ls",
  "pyright",
  "terraformls",
  "yamlls",
  "helm_ls",
  "dockerls",
  "docker_compose_language_service",
  "ansiblels",
}

-- список серверов с конфигурацией по умолчанию
local default_servers = {
  "terraformls",
  "dockerls",
  "docker_compose_language_service",
  "ansiblels",
}

-- lsp с дефолтным конфигом
for _, lsp in ipairs(default_servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

lspconfig.pyright.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,

  settings = {
    python = {
      analysis = {
        typeCheckingMode = "off", -- Disable type checking diagnostics
      },
    },
  },
}

lspconfig.yamlls.setup {
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

lspconfig.lua_ls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,

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
