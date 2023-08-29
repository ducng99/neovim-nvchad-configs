-- Checks if no_sync dir and no_sync/init exists
-- If it does, it will load it
if vim.fn.isdirectory "no_sync" and vim.fn.filereadable "no_sync/init" then
  require "no_sync/init"
end

vim.opt.tabstop = 8
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smarttab = true

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
