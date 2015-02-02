" load plugins
call plug#begin('~/.vim/plugged')

runtime! modules/*.vim

Plug 'tpope/vim-sensible'
Plug 'tomasr/molokai'                 " One true colour scheme
Plug 'kien/ctrlp.vim'                 " Fuzzy finder
Plug 'bling/vim-airline'              " Status bar
Plug 'myusuf3/numbers.vim'            " Intelligently toggle line numbers
Plug 'ap/vim-css-color'               " Adds color to CSS color codes
Plug 'thanthese/Tortoise-Typing'      " Touch typing tutor
Plug 'junegunn/limelight.vim'         " Highlight current paragraph
Plug 'Lokaltog/vim-easymotion'        " Vim motions on speed
Plug 'tpope/vim-surround'             " Easily manipulate surroundings
Plug 'junegunn/goyo.vim'              " Distraction free writing
Plug 'scrooloose/syntastic'

" Python plugins
Plug 'davidhalter/jedi-vim'           " Python autocompletion with jedi

" Clojure plugins
Plug 'guns/vim-clojure-static'        " Clojure syntax
Plug 'tpope/vim-fireplace'            " Clojure REPL
Plug 'tpope/vim-leiningen'            " Static vim support for Leiningen
Plug 'tpope/vim-dispatch'             " Async build and test dispatcher
Plug 'amdt/vim-niji'                  " Rainbow parentheses

call plug#end()

" Turn on syntax highlighting
syntax on

" Set tabs
set tabstop=4
set shiftwidth=4
set expandtab

" Set search options
set hlsearch                            " Highlight search
set incsearch                           " Immediately highlight
set ignorecase                          " Ignore case
set smartcase                           " Case sensitive if caps used

" Options for gvim
if has('gui_running')
  set guioptions-=T
  set columns=108 linespace=1
  if has('gui_win32')
    set guifont=DejaVu_Sans_Mono:h10:cANSI
  else
    set guifont=DejaVu\ Sans\ Mono\ 10
  endif
endif

" Automatically reload on changes to .vimrc
augroup reload_vimrc " {
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

" Turn line numbers on
set number

" Set colorscheme 
set t_Co=256
colorscheme molokai

" Easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-L> <C-W><C-L>

set splitbelow
set splitright
