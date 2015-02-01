set nocompatible                        " be iMproved, required
filetype off                            " required

" ------ Vundle ------
" set the runtime path to include Vundle and initialize
if has('gui_win32')
    set rtp+=~/vimfiles/bundle/Vundle.vim/
    let path='~/vimfiles/bundle'
    call vundle#begin(path)
else
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
endif

Plugin 'gmarik/Vundle.vim'              " Let vundle manage vundle
Plugin 'tpope/vim-sensible'             " Sensible defaults
Plugin 'tomasr/molokai'                 " One true colour scheme
Plugin 'kien/ctrlp.vim'                 " Fuzzy finder
Plugin 'bling/vim-airline'              " Status bar
Plugin 'myusuf3/numbers.vim'            " Intelligently toggle line numbers
Plugin 'ap/vim-css-color'               " Adds color to CSS color codes
Plugin 'thanthese/Tortoise-Typing'      " Touch typing tutor
Plugin 'junegunn/limelight.vim'         " Highlight current paragraph
Plugin 'Lokaltog/vim-easymotion'        " Vim motions on speed
Plugin 'tpope/vim-surround'             " Easily manipulate surroundings
Plugin 'junegunn/goyo.vim'              " Distraction free writing

" Python plugins
Plugin 'davidhalter/jedi-vim'           " Python autocompletion with jedi
Plugin 'klen/python-mode'               " Python mode for vim
let g:pymode_rope = 0                   " turn off rope as we're using jedi

" Clojure plugins
Plugin 'guns/vim-clojure-static'        " Clojure syntax
Plugin 'tpope/vim-fireplace'            " Clojure REPL
Plugin 'tpope/vim-leiningen'            " Static vim support for Leiningen
Plugin 'tpope/vim-dispatch'             " Async build and test dispatcher
Plugin 'amdt/vim-niji'                  " Rainbow parentheses

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" ------ /Vundle ------

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
