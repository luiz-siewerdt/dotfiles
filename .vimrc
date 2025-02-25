" Set this to 1 to use ultisnips for snippet handling
let s:using_snippets = 0

" vim-plug: {{{
call plug#begin('~/.vim/plugged')

Plug 'ghifarit53/tokyonight-vim'


call plug#end()
" }}}

set termguicolors

let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1

colorscheme sorbet

set backspace=indent,eol,start
set expandtab
set shiftround
set shiftwidth=2
set softtabstop=-1
set tabstop=2
set textwidth=80
set title

set hidden
set nofixendofline
set nostartofline
set splitbelow
set splitright

set hlsearch
set incsearch
set laststatus=2
set nonumber
set noruler
set noshowmode
set signcolumn=yes

set mouse=a
set updatetime=1000
" }}}

syntax on

set number

set relativenumber

set expandtab 
set tabstop=2
set shiftwidth=2
set softtabstop=2

set undofile

set incsearch

set hlsearch

