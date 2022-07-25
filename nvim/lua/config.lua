-- vim.bo.expandtab = true
-- vim.bo.ts = 2
-- vim.bo.shiftwidth = 2
-- vim.bo.softtabstop = 2

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.g.termguicolors = true

vim.cmd [[colorscheme rigel]]
-- vim.cmd [[termguicolors true]]
--
-- ...
-- Do not show current vim mode since it is already shown by Lualine
vim.o.showmode = false

-- enable autowriteall
vim.o.autowriteall = true

-- Show the line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- Show chars at the end of line
vim.opt.list = true

-- Enable break indent
vim.o.breakindent = true

--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250

-- Shows signs by Autocompletion plugin
vim.wo.signcolumn = 'yes'

-- Enable termguicolors. Very essential if you want 24-bit RGB color in TUI.
vim.o.termguicolors = true

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menu,menuone'

--Remap for dealing with word wrap
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

-- Highlight on yank
vim.cmd [[
augroup YankHighlight
autocmd!
autocmd TextYankPost * silent! lua vim.highlight.on_yank()
augroup end
]]
-- ...

vim.g.wildmenu = true
vim.g.ruler = true
vim.g.nohlsearch = true

--[
-- set ts=2
-- set foldenable
-- set foldlevelstart=10
-- set foldnestmax=10
-- set foldmethod=syntax
-- set path+=**
-- set smartindent
-- set ruler
-- set linebreak
-- set incsearch
-- set nohlsearch
-- set autowrite
-- set autoindent
-- set cursorline
-- set showmatch
-- set splitbelow splitright " Splits opened window at the bottom and right, 
-- set incsearch
-- set history=500
-- set background=dark
-- set encoding=UTF-8
-- set noswapfile
-- set colorcolumn=80
-- set iskeyword&
-- " from mastering vim quickly
-- set showcmd
-- set autoread
-- set hidden

--]
