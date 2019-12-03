syntax enable
set number
set relativenumber
set ruler
set linebreak
set incsearch
set hlsearch
autocmd FileType apache setlocal commentstring=#\ %s

:autocmd InsertEnter,InsertLeave * set cul!

" Configure vim's default file browser
" let g:netrw_banner = 0
" let g:netrw_liststyle = 3
" let g:netrw_browse_split = 4
" let g:netrw_altv = 1
" let g:netrw_winsize = 25
" augroup ProjectDrawer
  " autocmd!
  " autocmd VimEnter * : :Vexplore
" augroup END

" Mappings for NERDTree
autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowHidden = 1

" Move visual selection
vnoremap J :m '>+1<cr>gv=gv
vnoremap K :m '<-2<cr>gv=gv

" Disable arrow keys
map <Down> <NOP>
map <Up> <NOP>
map <Left> <NOP>
map <Right> <NOP>
inore jj <Esc>
" Operate on an entire file
onoremap af :<C-u>normal! ggVG<CR>

"Navigate between eslint errors / ale
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
" let g:ale_fixers['javascript'] = ['eslint']
"Fix files automatically on save
let g:ale_fix_on_save = 1

nmap <silent> <F6> <Plug>(ale_fix)

" FZF installed using git
set rtp+=~/.fzf
nnoremap <C-p> :Files<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>h :History<CR>

set smartindent
inoremap {<cr> {<cr>}<c-o><s-o>
inoremap [<cr> [<cr>]<c-o><s-o>
inoremap (<cr> (<cr>)<c-o><s-o>

" Always show statusline
set laststatus=2
set ts=2
set softtabstop=2
set autoindent
set expandtab
set shiftwidth=2
" set cursorline
set showmatch
let python_highlight_all = 1
set nocompatible "required
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'haishanh/night-owl.vim'
Plugin 'jacoborus/tender.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'w0rp/ale'
Plugin 'christoomey/vim-sort-motion'
Plugin 'SirVer/ultisnips'
Plugin 'mlaursen/vim-react-snippets'
Plugin 'wakatime/vim-wakatime'
Plugin 'Rigellute/rigel'
Plugin 'vim-airline/vim-airline'
Plugin 'dracula/vim'
Plugin 'flrnprz/candid.vim'
" Plugin 'vim-airline/vim-airline-themes'
call vundle#end()            " required

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'drewtempelmeyer/palenight.vim'
call plug#end()

filetype plugin indent on    " required

cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!
set incsearch
set background=dark
""""" enable 24bit true color
if (has("termguicolors"))
  set termguicolors
endif

" colorscheme night-owl
colorscheme rigel
" Spell-check set to F6
" map <F6> :setlocal spell! spelllang=en_us<CR>
