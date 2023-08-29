---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "vscode_dark",

  hl_override = {
    NvimTreeNormal = {
      bg = "darker_black",
    },
    NvimTreeNormalNC = {
      bg = "darker_black",
    },
    NvimTreeCursorLine = {
      bg = "black2",
    },
  },

  transparency = true,
}
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"
return M
