call plug#begin()
" Sensible defaults
Plug 'tpope/vim-sensible'
" Color schemes
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'morhetz/gruvbox'
Plug 'tomasr/molokai'
" Status bar
Plug 'bling/vim-airline'
" Tab completion
"Plug 'ervandew/supertab'
"let g:SuperTabDefaultCompletionType = "context"
" Javascript
Plug 'marijnh/tern_for_vim', { 'do': 'npm install && wget https://raw.githubusercontent.com/Slava/tern-meteor/master/meteor.js -O node_modules/tern/plugin/meteor.js' }
let g:tern_map_keys=1
let g:tern_show_argument_hints="on_hold"
Plug 'slava/vim-spacebars'
" Syntax checking
Plug 'scrooloose/syntastic'
let g:syntastic_check_on_open=1
let g:syntastic_javascript_checkers=['eslint']
" Fuzzy finder
Plug 'kien/ctrlp.vim'
" Tree explorer
Plug 'scrooloose/nerdtree'
map <C-n> :NERDTreeToggle<CR>
" Close NERDTree if only window remaining
autocmd bufenter *  if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" Git wrapper
Plug 'tpope/vim-fugitive'
" Quoting / parens made easy
Plug 'tpope/vim-surround'
" Code completion engine
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
let g:ycm_autoclose_preview_window_after_completion=1
" Start page
Plug 'mhinz/vim-startify'
" Buffer explorer
Plug 'fholgado/minibufexpl.vim'
call plug#end()

let $TERM = "xterm-256color"
set t_Co=256
set background=dark
syntax enable
colorscheme gruvbox
