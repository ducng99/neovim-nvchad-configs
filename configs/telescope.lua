local M = {
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = function(...)
          require("telescope.actions").close(...)
        end,
      },
    },
  },
  extensions_list = { "fzf" },
}

return M
