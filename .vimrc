set nocompatible 		" be iMproved, required
filetype off			" required

" ------ Vundle ------
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Colour schemes
Plugin 'Lokaltog/vim-distinguished'
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'tomasr/molokai'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" ------ /Vundle ------

" Turn on syntax highlighting
syntax on

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
