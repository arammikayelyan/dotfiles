" Plugins {{{

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" Plugin 'arcticicestudio/nord-vim'
" Plugin 'jacoborus/tender.vim' " Theme
" Plugin 'flrnprz/candid.vim' " Theme
" Plugin 'morhetz/gruvbox' " Theme
Plugin 'Rigellute/rigel' " Theme
Plugin 'sheerun/vim-polyglot' " Syntax highlighting
" Plugin 'w0rp/ale'
Plugin 'SirVer/ultisnips' " Snippets
Plugin 'Valloric/YouCompleteMe'
Plugin 'ervandew/supertab'
" Plugin 'mlaursen/vim-react-snippets' " Snippets
Plugin 'wakatime/vim-wakatime'
Plugin 'vim-airline/vim-airline'
Plugin 'jiangmiao/auto-pairs'
Plugin 'fatih/vim-go', { 'do': 'GoInstallBinaries' }
Plugin 'junegunn/limelight.vim'
Plugin 'junegunn/goyo.vim'
Plugin 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'tpope/vim-surround'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'ryanoasis/vim-devicons'
Plugin 'greymd/oscyank.vim'
Plugin 'tomtom/tcomment_vim' " Commenting
Plugin 'wincent/scalpel' " Multiple cursors
Plugin 'tpope/vim-fugitive'
Plugin 'unblevable/quick-scope'
" Plugin 'dyng/ctrlsf.vim' search and change an instance in whole project
" nmap leader>a :CtrlSF -R ""<Left>
" nmap <leader>A <Plug>CtrlSFCwordPath -W<CR>
" nmap <leader>c :CtrlSFFocus<CR>
" nmap <leader>C :CtrlSFToggle<CR>
call vundle#end()            " required

" }}}

" Tabs And Spaces {{{

set ts=2
set softtabstop=2
set shiftwidth=2
set expandtab

" }}}

" Section Folding {{{

set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=syntax
nnoremap <leader>f za

" }}}
" vim:foldmethod=marker:foldlevel=0

syntax enable
filetype plugin indent on    " required
set number
set smartindent
set relativenumber
set ruler
set linebreak
set incsearch
set nohlsearch
set autowrite
set laststatus=2 " Always show statusline
set autoindent
set cursorline
set showmatch
set nocompatible " Required by vundle
set splitbelow splitright " Splits opened window at the bottom and right, 
set incsearch
set history=500
set background=dark
set encoding=UTF-8
set bs=indent,eol,start " allow backspacing over everything
set noswapfile
set colorcolumn=80

" Map leader key
let mapleader = " "
" Fast saving
nnoremap <leader>w :w!<cr>
nnoremap <silent> <leader>q :q<CR>
" Bindings
command! Qall qall 
command! QA qall 
command! E e
" Execute macro in q
map Q @q

"""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE (THANKS GARY BERNHARDT) "
"""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
    exec ':// saveas ' . new_name
    if new_name != '' && new_name != old_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <Leader>n :call RenameFile()<cr>

autocmd FileType apache setlocal commentstring=#\ %s
" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd InsertEnter,InsertLeave * set cul!
autocmd BufReadPost *.doc,*.docx,*.rtf,*.odp,*.odt silent %!pandoc "%" -tplain -o /dev/stdout

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'


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
" autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-z> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowHidden = 1

" Goyo plugin makes text more readable when writing prose
map <leader>f :Goyo \| set linebreak <CR>

" Change cursor type
autocmd InsertEnter,InsertLeave * set cul!

" Move visual selection
vnoremap J :m '>+1<cr>gv=gv
vnoremap K :m '<-2<cr>gv=gv
vnoremap <C-c> "+y
" map <C-v> "+P

" Shortcuttings split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

" Mappings for vim-go
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <leader>i  <Plug>(go-info)
au BufRead,BufNewFile *.gohtml set filetype=gohtmltmpl " Syntax highlighting for .gohtml

" Configs for vim-go plugin
let g:go_fmt_command = "goimports" " automatically import
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_functions = 1

" Toggle last search highlight
nnoremap <F3> :set hlsearch!<CR>

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
let g:ale_fix_on_save = 1 "Fix files automatically on save

" FZF installed using git
set rtp+=~/.fzf
nnoremap <C-p> :Files<CR>
nnoremap <Leader>B :Buffers<CR>
nnoremap <Leader>h :History<CR>
nnoremap <Leader>H :History:<CR>
inoremap {<cr> {<cr>}<c-o><s-o>
inoremap [<cr> [<cr>]<c-o><s-o>
inoremap (<cr> (<cr>)<c-o><s-o>

""""""""""""""""""""""""""""""""""""""""""""""""""""
" make YCM compatible with Ultisnips (using supertab)
"""""""""""""""""""""""""""""""""""""""""""""""""""" 
function! g:UltiSnips_Complete()
  call UltiSnips#ExpandSnippet()
  if g:ulti_expand_res == 0
    if pumvisible()
      return "\<C-n>"
    else
      call UltiSnips#JumpForwards()
      if g:ulti_jump_forwards_res == 0
        return "\<TAB>"
      endif
    endif
  endif
  return ""
endfunction

function! g:UltiSnips_Reverse()
  call UltiSnips#JumpBackwards()
  if g:ulti_jump_backwards_res == 0
    return "\<C-P>"
  endif

  return ""
endfunction

if !exists("g:UltiSnipsJumpForwardTrigger")
  let g:UltiSnipsJumpForwardTrigger = "<tab>"
endif

if !exists("g:UltiSnipsJumpBackwardTrigger")
  let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
endif

au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsJumpBackwardTrigger . " <C-R>=g:UltiSnips_Reverse()<cr>"

cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Trigger a highlight only when pressing f and F.
let g:qs_highlight_on_keys = ['f', 'F']

colorscheme rigel
""""" enable 24bit true color
if (has("termguicolors"))
  set termguicolors
endif
