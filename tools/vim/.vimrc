" Install plugins via Plug
" :PlugInstall, :PlugUpdate, :PlugStatus, :PlugClean
" See, https://github.com/junegunn/vim-plug
call plug#begin()
Plug 'vim-scripts/bats.vim', { 'tag': '0.1.0' }                 " Extends the built in shell highlighting (sh.vim) for Bash Automated Testing System.
Plug 'vim-scripts/groovy.vim', { 'tag': '0.1.9' }               " Suppport Groovy syntax.
Plug 'vim-scripts/vim-gradle', { 'tag': '0.1'  }                " Support for Gradle and Groovy syntax
Plug 'catppuccin/vim', { 'branch': 'main', 'as': 'catppuccin' } " Catppuccin theme for Vim
Plug 'rodjek/vim-puppet', { 'tag': '1.0.0' }                    " Support for Puppet syntax
Plug 'vim-airline/vim-airline', { 'tag': 'v0.11' }              " Vim statusline/tabline.
Plug 'tpope/vim-fugitive', { 'branch': 'master' }               " Git support 
Plug 'editorconfig/editorconfig-vim', { 'branch': 'master' }    " Support for using .editorconfig files to maintain consistent coding styles
Plug 'vim-syntastic/syntastic', { 'branch': 'master' }          " Linter for multiple languages, note: It was archived Sep. 20th, 2023
call plug#end()

" Set syntax highlighting options
syntax on

filetype plugin indent on

" Enable terminal GUI colors
if has('termguicolors')
  set termguicolors
endif

" Color
let g:catppuccin_flavour = 'mocha'
colorscheme catppuccin_mocha

" Airline
let g:airline_theme = 'catppuccin_mocha'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
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

""""""""""""""""""""""""""""""""""""""""""""""
"       Begin Syntastic Config               "
""""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"""""""""""""""""""""""""""""""""""""""""""""
"      End Syntastic Config                 "
"""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""
"      Begin EditorConfig Config            "
"""""""""""""""""""""""""""""""""""""""""""""
let g:EditorConfig_exclude_patterns = ['fugitive://.*','scp://.*']
"""""""""""""""""""""""""""""""""""""""""""""
"      End EditorConfig Config              "
"""""""""""""""""""""""""""""""""""""""""""""

" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Force n column wrapping when in a git commmit
au FileType gitcommit set tw=72

" Normal Copy/Paste
" ctrl-v is paste
nmap <C-V> "+gP
" Ctrl-c is copy
vmap <C-C> "+y:
" Ctrl-x is cut
vnoremap <C-X> "+x