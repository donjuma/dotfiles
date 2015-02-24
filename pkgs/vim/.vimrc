set encoding=utf-8
set nocompatible
filetype on
set history=500
filetype plugin on
filetype plugin indent on
set lsp=0
set number
set ruler
set cmdheight=2
set backspace=2

set listchars=tab:>-
set listchars+=trail:.

set ai
set si
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set nowrap
set smarttab

set foldenable
set foldmethod=indent
set foldlevel=100
set foldopen-=search
set foldopen-=undo

set scrolloff=8

syntax on
set background=dark
colors molokai
autocmd! bufwritepost .vimrc source %
source ~/.vim/scripts/closetag.vim
let b:unaryTagsStack=""
inoremap <F9> <C-R>=GetCloseTag()<CR>

nmap <F5> :set invnumber <CR>
nmap <F6> :set nowrap! <CR>

set pastetoggle=<F8>
"set wildmode=list:longest
set wildmenu

set cursorline
set cursorcolumn

let &titlestring = hostname() . "[vim(" . expand("%:t") . ")]"
if &term == "screen"
  set t_ts=^[k
  set t_fs=^[\
endif
if &term == "screen" || &term == "xterm"
  set title
endif

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

autocmd BufWritePre * :%s/\s\+$//e
autocmd BufWritePre *.py :! touch ~/django/wwu_housing/wsgi.py
autocmd BufReadPost,FileReadPost,BufNewFile,BufEnter * call system("tmux rename-window " . expand("%"))
autocmd VimLeavePre * call system("tmux rename-window bash")

set pastetoggle=<F2>
set t_ut=