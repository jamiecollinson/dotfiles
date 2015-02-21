set runtimepath^=~/.vim

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
let g:syntastic_check_on_open=1
let g:syntastic_javascript_checkers = ['jsxhint']
let g:syntastic_javascript_jsxhint_exec = 'jsx-jshint-wrapper'
Plug 'Shougo/neocomplete.vim'
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#auto_completion_start_length = 1
let g:neocomplete#enable_smart_case = 1
if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.javascript = '[^. \t]\.\w*'
Plug 'scrooloose/nerdtree'            "File browser

" Python
Plug 'davidhalter/jedi-vim'           " Python autocompletion with jedi

" Clojure
Plug 'guns/vim-clojure-static'        " Clojure syntax
Plug 'tpope/vim-fireplace'            " Clojure REPL
Plug 'tpope/vim-leiningen'            " Static vim support for Leiningen
Plug 'tpope/vim-dispatch'             " Async build and test dispatcher
Plug 'amdt/vim-niji'                  " Rainbow parentheses

" Javascript
Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'Raimondi/delimitMate'
Plug 'marijnh/tern_for_vim'
Plug 'mxw/vim-jsx'
let g:jsx_ext_required = 0

call plug#end()

" Allow multiple buffers to be open
set hidden
" Turn off line wrapping
set nowrap
" Make backspace be sensible
set backspace=indent,eol,start
" Automatically indent
set autoindent
" Copy indentation if auto is confused
set copyindent

" Turn on syntax highlighting
syntax on

" Set colorscheme
set t_Co=256
set background=dark
colorscheme molokai

" Set tabs
set tabstop=4
set shiftwidth=4
set expandtab

" Highlight matching braces/tags
set showmatch

" Vim can set title of window
set title

" Use a visual indicator rather than a beep
set visualbell

" Toggle past mode with F2
set pastetoggle=<F2>

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

" Filetype specific things
autocmd FileType javascript setlocal omnifunc=tern#Complete

" Automatically reload on changes to .vimrc
augroup reload_vimrc " {
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

" Turn line numbers on
set number

" Easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-L> <C-W><C-L>
set splitright

" Easier escaping
:imap jk <Esc>

" Ignore certain dirs
set wildignore+=*/node_modules/*
