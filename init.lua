require("no_sync/init")

vim.opt.relativenumber = true

vim.opt.tabstop = 8
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smarttab = false

vim.wo.wrap = false
vim.o.relativenumber = true

-- Set indentation based on file type
vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  command = "setlocal noexpandtab tabstop=4 shiftwidth=4",
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  command = "setlocal expandtab tabstop=8 shiftwidth=2",
})
