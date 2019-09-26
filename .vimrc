" Keep 1000 items in the history
set history=500
" show incomplete commands
set showcmd
" show a menu when using tab completion
set wildmenu
set scrolloff=5
syntax enable
set number
set relativenumber
" show the cursor position
set ruler
set incsearch
set linebreak
autocmd FileType apache setlocal commentstring=#\ %s

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell


" Search down into subfolders
" Provides tab-complettion for all file-related tasks
" set path+=**

" Mappings for NERDTree
autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>

" Copied text from vim can be pasted by CTRL+V and
" copied text from CTRL+C can be pasted into vim with 'p'
set clipboard=unnamed
set clipboard=unnamedplus
" shows $ sign at the end of each line and shows ^I instead of tabs
" set list
" add date into text file
nmap <F3> i<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
imap <F3> <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>

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
set cursorline
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
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'majutsushi/tagbar'
Plugin 'vim-airline/vim-airline'
" Plugin 'vim-airline/vim-airline-themes'
call vundle#end()            " required

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
" post install (yarn install | npm install)
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
call plug#end()


filetype plugin indent on    " required

cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!
""""" enable 24bit true color
if (has("termguicolors"))
  set termguicolors
endif

" colorscheme night-owl
colorscheme rigel
" Spell-check set to F6
" map <F6> :setlocal spell! spelllang=en_us<CR>









