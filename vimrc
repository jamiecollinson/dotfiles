" vim: set fdm=marker :

" #Bundles {{{

" NeoBundle setup {{{
" Note: Skip initialisation for vim-tiny or vim-small
if !1 | finish | endif

if has('vim_starting')
  set nocompatible               " Be iMproved
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

call neobundle#end()
" }}}

" Run and manage child processes, dependency of many other plugins "{{{
NeoBundle 'Shougo/vimproc', {
  \     'build' : {
  \       'windows' : 'make -f make_mingw32.mak',
  \       'cygwin' : 'make -f make_cygwin.mak',
  \       'mac' : 'make -f make_mac.mak',
  \       'unix' : 'make -f make_unix.mak',
  \     },
  \   }
"}}}

" Sensible defaults {{{
NeoBundle 'tpope/vim-sensible'
" }}}

" #Colour schemes {{{
NeoBundle 'tomasr/molokai'                 
NeoBundle 'sjl/badwolf'                    
NeoBundle 'Lokaltog/vim-distinguished'     
NeoBundle 'goatslacker/mango.vim'          
NeoBundle 'whatyouhide/vim-gotham'         

" Set colorscheme
set t_Co=256
set background=dark
colorscheme molokai
" }}}

" #Visual improvements {{{

" Status bar
NeoBundle 'bling/vim-airline'

" Highlight current paragraph
NeoBundle 'junegunn/limelight.vim'

" }}}

" #Language specific - syntax and helpers {{{

" #Coffeescript {{{
" General syntax
NeoBundle 'kchmck/vim-coffee-script'
" Coffeescript with JSX (CJSX)
NeoBundle 'mtscout6/vim-cjsx'
" }}}

" #Javascript {{{
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'mxw/vim-jsx'
  let g:jsx_ext_required=0
NeoBundle 'wookiehangover/jshint.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'marijnh/tern_for_vim', { 'build': { 'others': 'npm install' } }
  let g:tern_map_keys=1
  let g:tern_show_argument_hints='on_hold'
" }}}

" #Clojure {{{
NeoBundle 'guns/vim-clojure-static'
" }}}

" #Python {{{
" Linting, code completion, refactoring
NeoBundle 'klen/python-mode'
  let g:pymode_rope = 0
" Better code completion - replaces rope in python-mode
NeoBundle 'davidhalter/jedi-vim'
"}}}

" #HTML / CSS {{{

" Zen coding for vim
NeoBundle 'mattn/emmet-vim'
" Add colors to CSS color codes
NeoBundle 'ap/vim-css-color'

" }}}

" }}}

" #Git integration {{{

" Git commands in vim
NeoBundle 'tpope/vim-fugitive'
" Git diff icons in gutter
NeoBundle 'airblade/vim-gitgutter'

" }}}

" Syntax highlighting {{{
NeoBundle 'scrooloose/syntastic'
  let g:syntastic_check_on_open=1
" }}}

" Auto-completion {{{
NeoBundle 'Shougo/neocomplete.vim'
  " Disable AutoComplPop.
  let g:acp_enableAtStartup = 0
  " Use neocomplete.
  let g:neocomplete#enable_at_startup = 1
  " Use smartcase.
  let g:neocomplete#enable_smart_case = 1
  " Set minimum syntax keyword length.
  let g:neocomplete#sources#syntax#min_keyword_length = 3
  let g:neocomplete#min_keyword_length = 3
  " Turn off scratch preview
  set completeopt-=preview
" }}}

" Seamless navigation between tmux and vim {{{
NeoBundle 'christoomey/vim-tmux-navigator'
" }}}

" Vim motions on speed {{{
NeoBundle 'Lokaltog/vim-easymotion'
" }}}

" File browser {{{
NeoBundle 'scrooloose/nerdtree'
" }}}

" Toggle comments with gc {{{
NeoBundle 'tpope/vim-commentary'
" }}}

" Easily manipulate surroundings {{{
NeoBundle 'tpope/vim-surround'
" }}}

" Start screen {{{
NeoBundle 'mhinz/vim-startify'
" }}}

" #Random plugins {{{

" Touch typing tutor
NeoBundle 'thanthese/Tortoise-Typing'
" Sublime text style minimap
NeoBundle 'severin-lemaignan/vim-minimap'
" Distraction free writing
NeoBundle 'junegunn/goyo.vim'

" }}}

" Check for uninstalled bundles {{{
" and prompt to install if found 
NeoBundleCheck
" }}}

" }}}

" #Essentials {{{

" Shortcut to edit .vimrc
nnoremap <leader>ev :e $MYVIMRC<CR>

" Shortcut to reload .vimrc
nnoremap <leader>sv :source $MYVIMRC<CR>

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

" Set tabs
set tabstop=2
set shiftwidth=2
set expandtab
autocmd Filetype python setlocal ts=4 sw=4 expandtab

" Highlight matching braces/tags
set showmatch

" Vim can set title of window
set title

" Use a visual indicator rather than a beep
set visualbell

" Set search options
set hlsearch                            " Highlight search
set incsearch                           " Immediately highlight
set ignorecase                          " Ignore case
set smartcase                           " Case sensitive if caps used
nnoremap <leader><space> :nohlsearch<CR>

" Folding
set foldenable                          " enable folding
set foldmethod=indent                   " fold based on indent
nnoremap <space> za                     " space opens fold

" swap and backup
set nobackup
set nowritebackup
set noswapfile

" Turn line numbers on
set number

set cursorline                      " highlight current line

" Easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-L> <C-W><C-L>
set splitright

" Easier escaping
:imap jk <Esc>

set wildmenu                        " visual autocomplete for command menu
set wildignore+=*/node_modules/*    " Ignore certain dirs

" }}}

" #Extra Functions {{{

" Remap <Enter> to split the line and insert a new line in between if BreakLine return True
fun! BreakLine()
  if (mode() == 'i')
    return ((getline(".")[col(".")-2] == '{' && getline(".")[col(".")-1] == '}') ||
          \(getline(".")[col(".")-2] == '(' && getline(".")[col(".")-1] == ')'))
  else
    return 0
  endif
endfun

inoremap <expr> <CR> BreakLine() ? "<CR><ESC>O" : "<CR>"

" }}}
