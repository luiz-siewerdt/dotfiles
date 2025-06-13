" Set this to 1 to use ultisnips for snippet handling
let s:using_snippets = 0

" vim-plug: {{{
call plug#begin('~/.vim/plugged')

Plug 'ghifarit53/tokyonight-vim'
Plug 'cocopon/iceberg.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'gkeep/iceberg-dark'

call plug#end()
" }}}

set termguicolors

let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1


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

let g:lightline = { 'colorscheme': 'icebergDark' }

colorscheme sorbet
colorscheme iceberg


let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" reset the cursor on start (for older versions of vim, usually not required)
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END


let mapleader = " "

map <C-s> :w!<CR>

map <C-h>  <C-w>h
map <C-l>  <C-w>l
map <C-j>  <C-w>j
map <C-k>  <C-w>k

map <leader>e :Explore<CR>
