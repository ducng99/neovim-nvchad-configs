local M = {}

local insert_moveLineStart = function()
  local col = vim.api.nvim_win_get_cursor(0)[2]

  if col == 0 then
    vim.cmd "normal! ^a"
  else
    vim.cmd "normal! 0i"
  end
end

local normal_moveLineStart = function()
  local col = vim.api.nvim_win_get_cursor(0)[2]

  if col == 0 then
    vim.cmd "normal! ^"
  else
    vim.cmd "normal! 0"
  end
end

M.custommap = {
  n = {
    ["<leader>sml"] = { "<cmd>SessionManager load_session<CR>", "Select a session" },
    ["<leader>sms"] = { "<cmd>SessionManager save_current_session<CR>", "Save current session" },
    ["<C-f>"] = { "<cmd>Telescope current_buffer_fuzzy_find<CR>", "Find in file" },
    ["<C-A-f>"] = { "<cmd>Telescope find_files<CR>", "Find files" },
    ["<C-d>"] = { "<C-d>zz", "Move half page down", opts = { noremap = true } },
    ["<C-u>"] = { "<C-u>zz", "Move half page up", opts = { noremap = true } },
    ["<S-Down>"] = { "v<Down>" },
    ["<S-Up>"] = { "v<Up>" },
    ["<Home>"] = { normal_moveLineStart, "Move to first non-blank character" },
    ["<C-a>"] = { normal_moveLineStart, "Move to first non-blank character" },
  },

  i = {
    ["<C-Del>"] = { "<Esc>ldwi", "Delete a word forward" },
    ["<M-BS>"] = { "<C-w>", "Delete a word backward" },
    ["<C-d>"] = { "<Esc>Ypi", "Duplicate a line" },
    ["<C-z>"] = {
      function()
        vim.cmd "undo"
      end,
      "Undo",
    },
    ["<C-y>"] = {
      function()
        vim.cmd "redo"
      end,
      "Redo",
    },
    ["<C-s>"] = {
      function()
        vim.cmd "w"
      end,
      "Save file",
    },
    ["<S-Down>"] = { "<Esc>lv<Down>", "Select down" },
    ["<S-Up>"] = { "<Esc>v<Up>", "Select up" },
    ["<S-Left>"] = { "<Esc>v", "Select left" },
    ["<S-Right>"] = { "<Esc>lv", "Select right" },
    ["<Home>"] = { insert_moveLineStart, "Move to first non-blank character" },
    ["<C-a>"] = { insert_moveLineStart, "Move to first non-blank character" },
  },

  v = {
    ["<S-Down>"] = { "<Down>" },
    ["<S-Up>"] = { "<Up>" },
    ["<C-f>"] = {
      'y<cmd>Telescope current_buffer_fuzzy_find<CR><C-r>"',
      "Search with selected text",
    },
    ["<C-h>"] = { 'y:%s/<C-r>"//gc<Left><Left><Left>', "Search & Replace selected text" },
    ["<C-d>"] = { "yp", "Duplicate selected text" },
  },
}

return M
