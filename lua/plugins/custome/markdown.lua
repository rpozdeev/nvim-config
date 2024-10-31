return {
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
    opts = {
      code = {
        -- sign = false,
        width = "block",
        right_pad = 1,
      },
      heading = {
        icons = {},
      },
      bullet = {
        enabled = true,
        right_pad = 1,
        icons = { "•", "◦", "✦", "✧" },
      },
    },
  },
}
