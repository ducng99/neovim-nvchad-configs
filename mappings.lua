local M = {}

M.custommap = {
  n = {
    ["<leader>sml"] = { "<cmd>SessionManager load_session<CR>", "Select a session" },
    ["<leader>sms"] = { "<cmd>SessionManager save_current_session<CR>", "Save current session" },
    ["<C-f>"] = { "<cmd>Telescope current_buffer_fuzzy_find<CR>", "Find in file" },
    ["<C-A-f>"] = { "<cmd>Telescope find_files<CR>", "Find Files" },
    ["<C-d>"] = { "<C-d>zz", "Move half page down", opts = { noremap = true } },
    ["<C-u>"] = { "<C-u>zz", "Move half page up", opts = { noremap = true } },
    ["<S-Down>"] = { "v<Down>" },
    ["<S-Up>"] = { "v<Up>" },
  },

  i = {
    ["<C-Del>"] = { "<Esc>ldwi", "Delete a word forward" },
    ["<M-BS>"] = { "<C-w>", "Delete a word backward" },
    ["<C-d>"] = { "<Esc>Ypi", "Duplicate a line" },
    ["<C-z>"] = { "<Esc>ui", "Undo" },
    ["<C-y>"] = { "<Esc><C-r>i", "Redo" },
    ["<C-s>"] = {
      function()
        vim.cmd "w"
      end,
      "Save file",
    },
    ["<S-Down>"] = { "<Esc>lv<Down>", "Select down" },
    ["<S-Up>"] = { "<Esc>lv<Up>", "Select up" },
    ["<S-Left>"] = { "<Esc>v", "Select left" },
    ["<S-Right>"] = { "<Esc>lv", "Select right" },
    ["<Home>"] = {
      function()
        local col = vim.api.nvim_win_get_cursor(0)[2]

        if col == 0 then
          vim.cmd "normal! ^a"
        else
          vim.cmd "normal! 0i"
        end
      end,
      "Move to first non-blank character",
    },
  },

  v = {
    ["<S-Down>"] = { "<Down>" },
    ["<S-Up>"] = { "<Up>" },
  },
}

return M
