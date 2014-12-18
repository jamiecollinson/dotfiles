" Use Vim settings. This must be first. It changes other options.
set nocompatible

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
colorscheme distinguished
