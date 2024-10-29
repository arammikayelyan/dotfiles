-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt

opt.hlsearch = false
opt.incsearch = true
opt.list = false

-- Go-specific settings
vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
    vim.opt_local.expandtab = true -- Use spaces instead of tabs
    vim.opt_local.shiftwidth = 4 -- Number of spaces to use for each indentation step
    vim.opt_local.tabstop = 4 -- Number of spaces a <Tab> counts for
    vim.opt_local.softtabstop = 4 -- Number of spaces a Tab key inserts
  end,
})
