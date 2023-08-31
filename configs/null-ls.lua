local null_ls = require "null-ls"

local formatting = null_ls.builtins.formatting
-- local lint = null_ls.builtins.diagnostics

local sources = {
  formatting.gofumpt,
  formatting.goimports_reviser,

  formatting.eslint_d.with {
    runtime_condition = function()
      return vim.fn.filereadable ".eslintrc.json" or vim.fn.filereadable ".eslintrc.js"
    end,
  },
  formatting.standardts.with {
    runtime_condition = function()
      return not vim.fn.filereadable ".eslintrc.json" and not vim.fn.filereadable ".eslintrc.js"
    end,
  },
  -- formatting.standardjs.with {
  --   runtime_condition = function()
  --     return not vim.fn.filereadable ".eslintrc.json" and not vim.fn.filereadable ".eslintrc.js"
  --   end,
  -- },

  -- formatting.prettier,
  formatting.stylua,
  formatting.phpcsfixer.with {
    extra_args = { "--using-cache=no" },
  },
  formatting.yamlfmt,
  formatting.markdownlint,
  -- lint.shellcheck,
}

null_ls.setup {
  sources = sources,
}
