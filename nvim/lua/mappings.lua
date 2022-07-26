local o = vim.o
local wo = vim.wo
local bo = vim.bo

-- global options
o.swapfile = true
o.dir = '/tmp'
o.smartcase = true
o.laststatus = 2
o.hlsearch = false
o.incsearch = true
o.ignorecase = true
o.scrolloff = 12
-- ... snip ... 

-- window-local options
wo.number = false
wo.wrap = false

-- buffer-local options
bo.expandtab = true

local keymap = vim.api.nvim_set_keymap
keymap('n', '<space>w', ':w<CR>', {})
keymap('n', '<space>q', ':q<CR>', {})
keymap('n', '<F2>', ':so %<CR>', {})

local opts = { noremap = true }
keymap('n', '<c-j>', '<c-w>j', opts)
keymap('n', '<c-h>', '<c-w>h', opts)
keymap('n', '<c-k>', '<c-w>k', opts)
keymap('n', '<c-l>', '<c-w>l', opts)

keymap('n', '#', '#zzzv', {desc = 'Search and center screen'})
keymap('n', '*', '*zzzv', {desc = 'Search and center screen'})
keymap('n', 'n', 'nzzzv', opts)
keymap('n', 'N', 'Nzzzv', opts)
keymap('n', '{', '{zzzv', opts)
keymap('n', '}', '}zzzv', opts)
keymap('n', 'J', 'mzJ`z', opts)
keymap('n', 'Y', 'y$', opts)
keymap('n', '<space>sa', 'ggVG<c-$>', opts)
keymap('n', 'cn', '*``cgn', opts)

keymap('n', '<space>k', ':m .-2<CR>==', opts)
keymap('n', '<space>j', ':m .+1<CR>==', opts)

-- Move visual selection
keymap('v', 'J', ":m '>+1<CR>gv=gv", opts)
keymap('v', 'K', ":m '<-2<CR>gv=gv", opts)
keymap('v', '<C-c>', '"+y', opts)
keymap('v', 'y', 'ygv<ESC>', opts)

keymap('n', '<space>ff', '<cmd>Telescope find_files<CR>', opts)
keymap('n', '<space>fg', '<cmd>Telescope live_grep<CR>', opts)
keymap('n', '<space>fb', '<cmd>Telescope buffers<CR>', opts)
keymap('n', '<space>fh', '<cmd>Telescope help_tags<CR>', opts)

keymap('n', '<space>e', '<cmd>NvimTreeToggle<CR>', opts)
keymap('n', '<space>gg', '<cmd>LazyGit<CR>', opts)

--[[

" Tab to switch buffers in Normal mode
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" Jumplist mutations
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u
inoremap ( (<c-g>u
inoremap ) )<c-g>u
inoremap { {<c-g>u
inoremap } }<c-g>u
inoremap [ [<c-g>u
inoremap ] ]<c-g>u
inoremap ; ;<c-g>u
inoremap : :<c-g>u
inoremap <C-j> <esc>:m .+1<CR>==
" inoremap {<cr> {<cr>}<c-o><s-o>
" inoremap [<cr> [<cr>]<c-o><s-o>
" inoremap (<cr> (<cr>)<c-o><s-o>

--]]

keymap('i', 'jj', '<ESC>', {})
