" vim: set fdm=marker:

" Variables {{{
let s:is_windows = has('win32') || has('win64')
"}}}

" Setting up vim-plug as the package manager {{{
if !filereadable(expand("~/.vim/autoload/plug.vim"))
    echo "Installing vim-plug and plugins. Restart vim after finishing the process."
    silent call mkdir(expand("~/.vim/autoload", 1), 'p')
    execute "!curl -fLo ".expand("~/.vim/autoload/plug.vim", 1)." https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    autocmd VimEnter * PlugInstall
endif

if s:is_windows
  set rtp+=~/.vim
endif

call plug#begin('~/.vim/plugged')

" Sensible defaults {{{
Plug 'tpope/vim-sensible'
" }}}

" #Colour schemes {{{
Plug 'tomasr/molokai'                 
Plug 'sjl/badwolf'                    
Plug 'Lokaltog/vim-distinguished'     
Plug 'goatslacker/mango.vim'          
Plug 'whatyouhide/vim-gotham'         
" }}}

" #Visual improvements {{{

" Status bar
Plug 'bling/vim-airline'

" Highlight current paragraph
Plug 'junegunn/limelight.vim'

" }}}

" #Language specific - syntax and helpers {{{

" #Coffeescript {{{
" General syntax
Plug 'kchmck/vim-coffee-script'
" Coffeescript with JSX (CJSX)
Plug 'mtscout6/vim-cjsx'
" }}}

" #Javascript {{{
Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
  let g:jsx_ext_required=0
Plug 'nathanaelkane/vim-indent-guides'
Plug 'Raimondi/delimitMate'
Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }
  let g:tern_map_keys=1
  let g:tern_show_argument_hints='on_hold'
" }}}

" #Clojure {{{
Plug 'guns/vim-clojure-static'
" }}}

" #Python {{{
" Linting, code completion, refactoring
Plug 'klen/python-mode'
  let g:pymode_rope = 0
" Better code completion - replaces rope in python-mode
Plug 'davidhalter/jedi-vim'
"}}}

" #HTML / CSS {{{

" Zen coding for vim
Plug 'mattn/emmet-vim'
" Add colors to CSS color codes
Plug 'ap/vim-css-color'

" }}}

" Markdown {{{
Plug 'tpope/vim-markdown'
" }}}

" }}}

" #Git integration {{{

" Git commands in vim
Plug 'tpope/vim-fugitive'
" Git diff icons in gutter
Plug 'airblade/vim-gitgutter'

" }}}

" Syntax highlighting {{{
Plug 'scrooloose/syntastic'
  let g:syntastic_check_on_open = 1
  let g:syntastic_javascript_checkers = ['eslint']
" }}}

" Auto-completion {{{
if s:is_windows
  Plug 'ajh17/VimCompletesMe'
else
  Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' }
endif
" }}}

" Seamless navigation between tmux and vim {{{
Plug 'christoomey/vim-tmux-navigator'
" }}}

" Vim motions on speed {{{
Plug 'Lokaltog/vim-easymotion'
" }}}

" File browser {{{
Plug 'scrooloose/nerdtree'
  let g:NERDTreeDirArrows=0
" Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'kien/ctrlp.vim'
" }}}

" Toggle comments with gc {{{
Plug 'tpope/vim-commentary'
" }}}

" Easily manipulate surroundings {{{
Plug 'tpope/vim-surround'
" }}}

" Start screen {{{
Plug 'mhinz/vim-startify'
" }}}

" #Random plugins {{{

" Touch typing tutor
Plug 'thanthese/Tortoise-Typing'
" Sublime text style minimap
Plug 'severin-lemaignan/vim-minimap'
" Distraction free writing
Plug 'junegunn/goyo.vim'

" }}}

" Check for uninstalled plugins {{{
" and prompt to install if found 
" }}}

call plug#end()

" }}}

" #Essentials {{{

" Set leader
let mapleader = " "

" Set colorscheme
set term=xterm
set t_Co=256
if s:is_windows " trick to support 256 colors in conemu for Windows
	let &t_AF="\e[38;5;%dm"
	let &t_AB="\e[48;5;%dm"
endif
set background=dark
colorscheme molokai

" Set modelines on
set modeline

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
set foldlevelstart=10
set foldnestmax=10
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
set splitbelow

" Easier escaping
:imap jk <Esc>

" Easier saving
nnoremap w :w<cr>

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
