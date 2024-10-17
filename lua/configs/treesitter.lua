local options = {
  ensure_installed = {
    "bash",
    -- "c",
    -- "cmake",
    -- "cpp",
    -- "go",
    -- "gomod",
    -- "gosum",
    -- "gotmpl",
    -- "gowork",
    -- "haskell",
    "lua",
    "luadoc",
    -- "make",
    "markdown",
    "printf",
    "python",
    "ninja",
    "toml",
    "vim",
    "vimdoc",
    "yaml",
  },

  highlight = {
    enable = true, -- Включаем подсветку
    additional_vim_regex_highlighting = false, -- Отключаем стандартную Vim-подсветку
    use_languagetree = true,
  },
  indent = {
    enable = true, -- Включаем авто-отступы
  },
}

require("nvim-treesitter.configs").setup(options)
