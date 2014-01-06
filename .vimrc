set t_Co=256
set fileformats=unix,dos,mac
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"<Bundles>
Bundle 'gmarik/vundle'
Bundle 'Lokaltog/vim-powerline'
Bundle 'tpope/vim-fugitive'
Bundle 'nanotech/jellybeans.vim'
"</Bundles>

set ambiwidth=double
set backspace=2
set shiftwidth=4
set tabstop=4
set autoindent
set expandtab
set mouse=

syntax on
colorscheme jellybeans
set number
set colorcolumn=120

set list
set listchars=tab:▸\ 
set tags+=tags,./tags

autocmd FileType php  set omnifunc=phpcomplete#CompletePHP
autocmd FileType html,javascript set omnifunc=javascriptcomplete#CompleteJS

au BufRead,BufNewFile *.php.sample setfiletype php
au BufRead,BufNewFile *.phpt setfiletype php
au BufRead,BufNewFile *.vcl setfiletype c
au BufRead,BufNewFile *.js.src setfiletype javascript
au BufRead,BufNewFile *.twig set syntax=htmldjango

set noswapfile
set nobackup
set autoread

map H :bp<Enter>
map L :bn<Enter>

map t g<C-]>
map <C-n> ]c
map <C-b> [c

let php_folding=1
au Syntax php set fdm=syntax
highlight Folded ctermfg=green
highlight FoldColumn ctermfg=green
let php_sql_query=1

set hlsearch
set showcmd
set laststatus=2
set title

imap <C-O> <C-X><C-O>

set statusline=%<%f\ %m%R%H%W%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P 

set incsearch
set ignorecase
set smartcase

" copied from http://vim-users.jp/2011/02/hack202/
augroup vimrc-auto-mkdir  " {{{
  autocmd!
  autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
  function! s:auto_mkdir(dir, force)  " {{{
    if !isdirectory(a:dir) && (a:force ||
    \    input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
      call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
  endfunction  " }}}
augroup END  " }}}

filetype plugin indent on
