local plugins = {
  {
    "Shatur/neovim-session-manager",
    lazy = false,
  },
  {
    "neovim/nvim-lspconfig",

    dependencies = {
      {
        "jose-elias-alvarez/null-ls.nvim",
        opts = function()
          return require "custom.configs.null-ls"
        end,
      },
      {
        "github/copilot.vim",
      },
    },

    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = require "custom.configs.telescope",
  },
  {
    "williamboman/mason.nvim",
    opts = require "custom.configs.mason",
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      filters = {
        custom = { "^\\.git$" },
      },
    },
  },
  {
    "tpope/vim-fugitive",
    cmd = { "G", "Git" },
  },
  {
    "stevearc/dressing.nvim",
    lazy = false,
  },
}

return plugins
