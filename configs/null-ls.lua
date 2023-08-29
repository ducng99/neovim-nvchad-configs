local null_ls = require "null-ls"

local formatting = null_ls.builtins.formatting
-- local lint = null_ls.builtins.diagnostics

local sources = {
  formatting.gofumpt,
  formatting.goimports_reviser,

  formatting.eslint_d,
  -- formatting.standardts.with({
  --   condition = function(utils)
  --     return not utils.root_has_file(".eslintrc.json") and not utils.root_has_file(".eslintrc.js")
  --   end
  -- }),
  -- formatting.standardjs.with({
  --   condition = function(utils)
  --     return not utils.root_has_file(".eslintrc.json") and not utils.root_has_file(".eslintrc.js")
  --   end
  -- }),

  -- formatting.prettier,
  formatting.stylua,
  formatting.phpcsfixer,
  formatting.yamlfmt,

  -- lint.shellcheck,
}

null_ls.setup {
  debug = true,
  sources = sources,
}
