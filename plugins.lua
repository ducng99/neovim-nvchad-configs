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
    opts = {
      defaults = {
        mappings = {
          i = {
            ["<esc>"] = function(...)
              require("telescope.actions").close(...)
            end,
          },
        },
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "css-lsp",
        "eslint-lsp",
        "gopls",
        "lua-language-server",
        "svelte-language-server",
        "typescript-language-server",
        "gofumpt",
        "goimports-reviser",
        "standardjs",
        "ts-standard",
        "stylua",
        "eslint_d",
      },
    },
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
}

return plugins
