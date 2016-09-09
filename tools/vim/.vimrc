execute pathogen#infect()

" Set syntax highlighting options
syntax on

filetype plugin indent on

" Set theme
colorscheme molokai
let g:rehash256 = 1

" Add Airline theme & enable powerline
let g:airline_theme='molokai'
let g:airline_powerline_fonts = 1

" Make Vim more useful
set nocompatible

" Copy indent from last line when starting new line
set autoindent
" Allow backspace in insert mode
set backspace=indent,eol,start
" Highlight current line
set cursorline
" Enable line numbers
set number
" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Don’t add empty newlines at the end of files
set binary
" Insert space characters whenever the tab key is pressed
set expandtab
" Make tabs as wide as two space
set tabstop=2
" Space characters inserted for indentation
set shiftwidth=2
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title

" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Force n column wrapping when in a git commmit
au FileType gitcommit set tw=72

" Normal Copy/Paste
nmap <C-V> "+gP
nmap <C-V> "+gP 
imap <C-V> <ESC><C-V>i 
vmap <C-C> "+y