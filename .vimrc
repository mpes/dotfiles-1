set nocompatible

" Plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'fatih/vim-go'
Plugin 'Shougo/neocomplete.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'airblade/vim-gitgutter'
Plugin 'kshenoy/vim-signature'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'jiangmiao/auto-pairs'
Plugin 'easymotion/vim-easymotion'
Plugin 'godlygeek/tabular'
call vundle#end()


" Colors
set t_co=256
set background=dark
syntax on
filetype plugin indent on
colorscheme molokai

" Core keymaps
let mapleader=","
imap jk <Esc>
map ; :
noremap ;; ;

" Backups
" set backupdir=~/.vim/backups
" set directory=~/.vim/swaps
" set undodir=~/.vim/undo

" General
set autoindent                                             "  Copy indent from last line when starting new line
set autoread                                               "  Automatically load files changed outside of vim
set backspace=indent,eol,start                             "  Allow backspace in insert mode
set clipboard=unnamed                                      "  Share clipboard with OS X
set esckeys                                                "  Allow cursor keys in insert mode
set expandtab                                              "  Expand tabs to spaces
set formatoptions=ql                                       "  Don't continue comments
set laststatus=2                                           "  Always show status bar
set lazyredraw                                             "  Only render when needed
set noerrorbells                                           "  Disable error bells
set noshowmode                                             "  Do not show current mode (airline shows it)
set scrolloff=3                                            "  Scroll offset on top/bottom
set shortmess+=I                                           "  Disable vim intro screen
set ttyfast                                                "  Send more characters at a time
set undofile                                               "  Persistent undo
set visualbell                                             "  Visual bell instead of audio
set fillchars=""                                           "  Disable - | chars on horizontal/vertical splits

" Indentation
set shiftwidth=2                                           "  Shift indentation 2 spaces
set smarttab                                               "  At beginning of line Tab inserts shiftwidth spaces
set softtabstop=2                                          "  Convert a tab to 2 spaces
set tabstop=2                                              "  Set tab 2 spaces wide

" Navigation
set number                                                 "  Absolute line number on active line (required vim 7.4+)
set relativenumber                                         "  Relative line numbers

" Search
set hlsearch                                               "  Highlight all search results
set ignorecase                                             "  Ignore case (for opening files etc)
set incsearch                                              "  Search as you type

" Key remaps
"  Scroll up 3 lines at a time
nnoremap <C-e> 3<C-e>
"  Scroll down 3 lines at a time
nnoremap <C-y> 3<C-y>
"  Yank to end of line
nnoremap Y y$
"  Add a line below with enter
nnoremap <CR> o<Esc>
"  Move current line up with Ctrl-j, maintaining indentation
nnoremap <C-j> :m .+1<CR>==
"  Move current line up with Ctrl-k, maintaining indentation
nnoremap <C-k> :m .-2<CR>==                                
"  Search current word with leader-s
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>

" -------------------------------------
" Plugin config

" Airline
let g:airline_powerline_fonts = 1                          "  Enable powerline fonts
let g:airline_theme = "powerlineish"                       "  Set theme
let g:airline_extensions = ['branch', 'ctrlp', 'tabline']  "  Set extensions
let g:airline_section_y = ''                               "  Disable showing encoding
let g:airline_section_z = '%3p%%  %l/%L  %c'               "  Simplified percent lines/total column
let g:airline#extensions#tabline#tab_nr_type = 1           "  Show tab number
let g:airline#extensions#tabline#show_tab_type = 0         "  Hide tab type
nmap <leader>1 <Plug>AirlineSelectTab1                     "  Jump to tab n
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

" vim-go
let g:go_highlight_functions = 1                           "  Highlight things
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"                         "  Run goimports on save

" ctrlp
let g:ctrlp_custom_ignore = 'vendor'                       "  Ignore vendor dir in search

" NERDTree
map <C-n> :NERDTreeToggle<CR>                              "  Toggle tree view with ctrl-n
