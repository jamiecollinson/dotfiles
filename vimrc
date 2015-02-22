" explicitly set runtimepath so windows and linux behave the same
set runtimepath^=~/.vim

" install vim-plug if it doesn't exist
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

" load plugins
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'             " Sensible defaults
Plug 'tomasr/molokai'                 " One true colour scheme
Plug 'sjl/badwolf'                    " Good for JS
Plug 'Lokaltog/vim-distinguished'     " Distinguished colour scheme
Plug 'goatslacker/mango.vim'          " Awesome colour scheme for js
Plug 'kien/ctrlp.vim'                 " Fuzzy finder
Plug 'bling/vim-airline'              " Status bar
Plug 'myusuf3/numbers.vim'            " Intelligently toggle line numbers
Plug 'ap/vim-css-color'               " Adds color to CSS color codes
Plug 'thanthese/Tortoise-Typing'      " Touch typing tutor
Plug 'junegunn/limelight.vim'         " Highlight current paragraph
Plug 'Lokaltog/vim-easymotion'        " Vim motions on speed
Plug 'tpope/vim-surround'             " Easily manipulate surroundings
Plug 'junegunn/goyo.vim'              " Distraction free writing
Plug 'scrooloose/nerdtree'            " File browser
Plug 'scrooloose/syntastic'           " Syntax highlighting
  let g:syntastic_check_on_open=1
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' }
  let g:ycm_add_preview_to_completeopt=0
  let g:ycm_confirm_extra_conf=0
  set completeopt-=preview
Plug 'tpope/vim-fugitive'             " git integration for vim
Plug 'airblade/vim-gitgutter'         " show git diff in gutter
Plug 'mattn/emmet-vim'                " zen coding
Plug 'SirVer/ultisnips'               " ultimate snippets
  let g:UltiSnipsExpandTrigger="<c-j>"
  let g:UltiSnipsJumpForwardTrigger="<c-j>"
  let g:UltiSnipsJumpBackwardTrigger="<c-k>"
Plug 'honza/vim-snippets'             " ultimate collection of snippets
Plug 'tpope/vim-commentary'           " comment stuff with gc
Plug 'severin-lemaignan/vim-minimap'  " sublime text style minimap

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
set foldlevelstart=10                 " open most folds by default
set foldnestmax=10                    " 10 nested fold max
set foldmethod=indent                 " fold based on indent
nnoremap <space> za

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
nnoremap <leader>ev :e $MYVIMRC<CR>
augroup reload_vimrc " {
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

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

" Remap <Enter> to split the line and insert a new line in between if BreakLine return True
fun BreakLine()
  if (mode() == 'i')
    return ((getline(".")[col(".")-2] == '{' && getline(".")[col(".")-1] == '}') ||
          \(getline(".")[col(".")-2] == '(' && getline(".")[col(".")-1] == ')'))
  else
    return 0
  endif
endfun

inoremap <expr> <CR> BreakLine() ? "<CR><ESC>O" : "<CR>"
