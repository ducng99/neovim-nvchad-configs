local plugins = {
  {
    "Shatur/neovim-session-manager",
    lazy = false,
  },
  {
    "neovim/nvim-lspconfig",

    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    opts = function()
      require "custom.configs.null-ls"
    end,
  },
  {
    "github/copilot.vim",
    event = "InsertEnter",
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
      },
    },
    config = function(_, opts)
      local telescope = require "telescope"
      telescope.setup(opts)
      telescope.load_extension "fzf"
    end,
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
    cmd = "Telescope",
  },
}

return plugins
