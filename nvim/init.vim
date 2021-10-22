syntax enable
let mapleader = " "

set ts=2
set softtabstop=2
set shiftwidth=2
set expandtab
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=syntax
set path+=**
set number relativenumber
set wildmenu
set smartindent
set ruler
set linebreak
set incsearch
set nohlsearch
set autowrite
set autoindent
set cursorline
set showmatch
set splitbelow splitright " Splits opened window at the bottom and right, 
set incsearch
set history=500
set background=dark
set encoding=UTF-8
set noswapfile
set colorcolumn=80
set iskeyword&
" from mastering vim quickly
set showcmd
set autoread
set hidden

nnoremap <leader>w :w!<CR>
nnoremap <silent> <leader>q :q!<CR>
nnoremap <F3> :set hlsearch!<CR> 
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap } }zzzv
nnoremap { {zzzv
nnoremap J mzJ`z
nnoremap Y y$
nnoremap <leader>sa ggVG<c-$>
nnoremap cn *``cgn

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Tab to switch buffers in Normal mode
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" Jumplist mutations
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'
nnoremap <leader>k :m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==

inoremap jj <ESC>
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

" Move visual selection
vnoremap J :m '>+1<cr>gv=gv
vnoremap K :m '<-2<cr>gv=gv
vnoremap <C-c> "+y
vnoremap y ygv<Esc> 

" Shortcuttings split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

call plug#begin('~/.vim/plugged')

  Plug 'Rigellute/rigel' " Theme
  Plug 'sheerun/vim-polyglot' " Syntax highlighting
  "Plug 'wellle/targets.vim' " Adds various text objects
  " Plug 'ycm-core/YouCompleteMe'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'lambdalisue/fern.vim'
  Plug 'ervandew/supertab'
  Plug 'wakatime/vim-wakatime'
  " Plug 'vim-airline/vim-airline'
  Plug 'jiangmiao/auto-pairs'
  Plug 'fatih/vim-go'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'tpope/vim-surround'
  Plug 'AndrewRadev/splitjoin.vim'
  Plug 'ryanoasis/vim-devicons'
  Plug 'greymd/oscyank.vim'
  Plug 'tomtom/tcomment_vim' " Commenting
  Plug 'wincent/scalpel' " Multiple cursors
  Plug 'tpope/vim-fugitive'
  Plug 'unblevable/quick-scope'
  Plug 'dense-analysis/ale'

" Plebvim lsp Plugins
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'mattn/emmet-vim'

Plug 'Rigellute/rigel'

" Plug 'nvim-lua/completion-nvim'
Plug 'glepnir/lspsaga.nvim'
Plug 'simrat39/symbols-outline.nvim'
" Plug 'tjdevries/nlua.nvim'
" Plug 'tjdevries/lsp_extensions.nvim'

" Neovim Tree shitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

" Debugger Plugins
Plug 'mfussenegger/nvim-dap'
Plug 'Pocco81/DAPInstall.nvim'
Plug 'szw/vim-maximizer'

" Snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'

Plug 'darrikonn/vim-gofmt'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'tpope/vim-dispatch'
Plug 'theprimeagen/vim-be-good'
Plug 'tpope/vim-projectionist'
Plug 'tomlion/vim-solidity'

" telescope requirements...
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

Plug 'vim-conf-live/vimconflive2021-colorscheme'
Plug 'flazz/vim-colorschemes'
Plug 'chriskempson/base16-vim'

" prettier
Plug 'sbdchd/neoformat'
call plug#end()

set termguicolors

colorscheme rigel
