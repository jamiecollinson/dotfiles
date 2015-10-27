call plug#begin()
" Sensible defaults
Plug 'tpope/vim-sensible'
" Color schemes
Plug 'chriskempson/base16-vim'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'morhetz/gruvbox'
Plug 'tomasr/molokai'
" Status bar
Plug 'bling/vim-airline'
" Tab completion
Plug 'ervandew/supertab'
let g:SuperTabDefaultCompletionType = "context"
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
call plug#end()

let $TERM = "xterm-256color"
set t_Co=256
set background=dark
syntax enable
colorscheme gruvbox
