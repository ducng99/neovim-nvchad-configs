local plugins = {
  {
    "ducng99/neovim-session-manager",
    lazy = false,
    config = function()
      local session_manager = require "session_manager"
      local config = require "session_manager.config"
      session_manager.setup {
        autoload_mode = config.AutoloadMode.CurrentDirOrLastSession,
      }
    end,
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
    dependencies = "nvim-lua/plenary.nvim",
    event = "VeryLazy",
    config = function()
      require "custom.configs.null-ls"
    end,
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup {
        suggestion = {
          auto_trigger = true,
        },
      }
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
      },
    },
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
    event = "VeryLazy",
  },
  {
    "folke/neodev.nvim",
    ft = "lua",
  },
}

return plugins
