# Конфигурация nvim на базе NvChad v3.0

LSP (dap, test, format, lint): - python - ansible - terraform - helm - docker - markdown

## Требования

Установить im-select. Данное приложение автоматически переключает раскладку при смене буфера NORMAL-INSERT

```bash
brew tap daipeihust/tap
brew install im-select
```

## Проверка орфографии

`zg` - добавить в словарь
`zug` - удалить из словаря
`z=` - предложить варианты написания

Скачать необходимые словари [vim-spellfiles](https://ftp.nluug.nl/pub/vim/runtime/spell/)
Поместить скачанные файлы (например, _ru.utf-8.spl_ и _ru.utf-8.sug_) в папку:
`~/.local/share/nvim/site/spell/`

В `lua/options.lua` включить поддержку нужного языка

```bash
vim.opt.spell = true
vim.opt.spelllang = { "ru", "en" }
```
