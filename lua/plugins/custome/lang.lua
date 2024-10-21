return {
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
}
