-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
-- NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


local keymap = vim.api.nvim_set_keymap
-- write only if changed
keymap('n', '<space>w', ':up<CR>', {})
keymap('n', '<space>q', ':q<CR>', {})
keymap('n', '<F1>', ':so %<CR>', {})
-- delete all buffers except the current one
keymap('n', '<leader>bd', '<cmd>%bd | e# | bd#<cr>', {})

keymap('n', '<leader>pi', '<cmd>PackerInstall<cr>', {})
keymap('n', '<leader>ps', '<cmd>PackerSync<cr>', {})

keymap('i', 'jj', '<ESC>', {})

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
keymap('n', '<space>sa', 'ggVG<c-$>', opts) -- Select all
keymap('n', 'cn', '*``cgn', opts)

keymap('n', 'gl', '$', opts) -- go to the end of the line
keymap('n', 'gh', '^', opts) -- go to the start of the line

keymap('n', '<space>k', ':m .-2<CR>==', opts)
keymap('n', '<space>j', ':m .+1<CR>==', opts)

-- Move visual selection
keymap('v', 'J', ":m '>+1<CR>gv=gv", opts)
keymap('v', 'K', ":m '<-2<CR>gv=gv", opts)
keymap('v', '<C-c>', '"+y', opts)
keymap('v', 'y', 'ygv<ESC>', opts)

keymap('n', '<leader>y', "\"+y", opts)
keymap('v', '<leader>y', "\"+y", opts)
keymap('n', '<leader>Y', "\"+y", opts)

keymap('n', '<leader>d', "\"_d", opts)
keymap('v', '<leader>d', "\"_d", opts)


-- keymap("n", "Q", "<nop>")
-- keymap("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
-- keymap("n", "<leader>p", function()
-- 	lsp.buf.format()
-- end)
-- 
-- keymap("n", "<C-k>", "<cmd>cnext<CR>zz")
-- keymap("n", "<C-j>", "<cmd>cprev<CR>zz")
-- keymap("n", "<leader>k", "<cmd>lnext<CR>zz")
-- keymap("n", "<leader>j", "<cmd>lprev<CR>zz")
-- 
-- keymap("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
-- keymap("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

keymap("v", "<", "<gv", { noremap = true, silent = true })
keymap("v", ">", ">gv", { noremap = true, silent = true })



keymap('n', '<space>e', '<cmd>NvimTreeToggle<CR>', opts)
keymap('n', '<space>lg', '<cmd>LazyGit<CR>', opts)


-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- *Quickly surround Words*
-- filetype specific quick surrounds in ftps
-- vS to surround selection with argument
-- cs'" will change single to double quotes. Flip or change surroundings as needed.
-- ds{surrounding} to remove surroundings
-- Surround word under cursor w/ backticks (required vim-surround)
keymap("n", "<leader>`", "ysiW`", { noremap = false })
-- Surround word under cursor w/ double quotes (required vim-surround)
keymap("n", '<leader>"', 'ysiW"', { noremap = false })
-- Surround word under cursor w/ single quotes (required vim-surround)
keymap("n", "<leader>'", "ysiW'", { noremap = false })
-- copy plus register contents to "c reqister
keymap("n", "<space>c", [[<cmd>let @c=@+<CR>]], { noremap = true })
-- paste from "c
keymap("n", "<space>p", '"cp', { noremap = true })
-- REPLACE: cut inner word to "r & replace with last yanked (including system)
-- Or, visually select and p
keymap("n", ",r", '"rdiwhp', { noremap = true })
-- DELETE: with y,d or c{motion} & it wont replace "0
keymap("n", "_", '"_', { noremap = true })
-- paste last thing yanked(not system copied), not deleted
keymap("n", ",p", '"0p', { noremap = true })
keymap("n", ",P", '"0P', { noremap = true })

-- Open File Name under cursor in vert split
keymap("n", "<leader>gf", ":vs <cfile><CR>", { noremap = false, silent = true })

-- Move between Vimdows
keymap("n", "<up>", "<C-w><up>", { noremap = false })
keymap("n", "<down>", "<C-w><down>", { noremap = false })
keymap("n", "<left>", "<C-w><left>", { noremap = false })
keymap("n", "<right>", "<C-w><right>", { noremap = false })

-- vsnip jump through snippets with <Tab>
keymap(
    "i",
    "<Tab>",
    [[vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>']],
    { noremap = false, expr = true }
)
keymap(
    "s",
    "<Tab>",
    [[vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>']],
    { noremap = false, expr = true }
)
keymap(
  "i",
  "<S-Tab>",
  [[vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>']],
  { noremap = false, expr = true }
)
keymap(
  "s",
  "<S-Tab>",
  [[vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>']],
  { noremap = false, expr = true }
)


