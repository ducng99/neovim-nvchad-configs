local plugins = {
  {
    "github/copilot.vim",
    lazy = false
  },
  {
    "Shatur/neovim-session-manager",
    lazy = false
  },
  {
    "neovim/nvim-lspconfig",

    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      opts = function()
        return require "custom.configs.null-ls"
      end
    },

    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end
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
        "ts-standdard",
        "stylua",
        "eslint_d"
      }
    }
  }
}

return plugins
