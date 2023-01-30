-- [[ Setting options ]]
-- See `:help vim.o`
vim.cmd [[colorscheme rigel]]

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Set colorscheme
vim.o.termguicolors = true

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

local opt = vim.opt

vim.scriptencoding = 'utf-8'
opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'

opt.scrolloff = 5
opt.sidescrolloff = 5

opt.hlsearch = false
opt.incsearch = true

opt.clipboard:append('unnamedplus')

opt.swapfile = false
opt.autoread = true
vim.bo.autoread = true

opt.list = true

opt.cursorline = true

vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 300
        })
    end
})

opt.whichwrap = 'h,l'

opt.timeoutlen = 500

