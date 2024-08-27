-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- -- Enable break indent
-- vim.o.breakindent = true
-- -- Case insensitive searching UNLESS /C or capital in search
-- -- Decrease update time
-- vim.o.updatetime = 250
-- vim.wo.signcolumn = "yes"
--
-- -- Set completeopt to have a better completion experience
-- vim.o.completeopt = "menuone,noselect"
--
local opt = vim.opt
--
vim.scriptencoding = "utf-8"
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.scrolloff = 5
opt.sidescrolloff = 5

opt.hlsearch = false
opt.incsearch = true

opt.clipboard:append("unnamedplus")

opt.swapfile = false
opt.autoread = true
vim.bo.autoread = true

opt.list = true

opt.cursorline = true

vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = 300,
        })
    end,
})

opt.whichwrap = "h,l"

opt.timeoutlen = 500
