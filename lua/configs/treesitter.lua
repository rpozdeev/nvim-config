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
    "json5",
    "markdown",
    "printf",
    "python",
    "ninja",
    "toml",
    "vim",
    "vimdoc",
    "yaml",
    "terraform",
    "hcl",
    "helm",
    "dockerfile",
    "git_config",
    "gitcommit",
    "git_rebase",
    "gitignore",
    "gitattributes",
    "sql",
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
