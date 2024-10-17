local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- Отключение виртуального текста для предупреждений
-- vim.diagnostic.config {
--   virtual_text = false, -- Отключить виртуальный текст диагностики
--   -- virtual_text = {
--   --   prefix = '●', -- Префикс для виртуального текста диагностики
--   -- },
--   signs = true, -- Включить отображение знаков
--   update_in_insert = true, -- Обновлять диагностику в режиме INSERT
--   underline = true, -- Подчеркивать проблемные участки кода
-- }

-- список серверов для конфигурации
lspconfig.servers = {
  "lua_ls",
}

-- список серверов с конфигурацией по умолчанию
local default_servers = {}

-- lsp с дефолтным конфигом
for _, lsp in ipairs(default_servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

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
