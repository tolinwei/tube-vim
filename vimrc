" General syntax
syntax on
set number
colorscheme gruvbox
set background=dark
set number
set backspace=indent,eol,start

" http://vim.wikia.com/wiki/Indenting_source_code
set expandtab			                " When press <TAB> key, insert 'softtabstop' amount of space
set shiftwidth=4		                " Affects when press >>, << or ==
set softtabstop=4		                " Set it the same sa shiftwidth when using SPACE indention
				                " , default value is the same as 'tabstop'
set smartindent                                 " Copy indentation from previous line
                                                " , and add extra level in some cases
set nowrap                                      " Don't wrap lines
set hlsearch
autocmd BufWritePre * :%s/\s\+$//e              " Delete all trailing whitespaces on save
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 80 words onwards as "warning" and 120 words as "danger"
" for both industry standard (80 columns) and Yahoo standards (120 columns)
if exists('+colorcolumn')
    let &colorcolumn="81,".join(range(121,999),",")
    " set colorcolumn=81
else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>81v.\+', -1)
endif
" execute "set colorcolumn=" . join(range(121,999), ',')  " Correct
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The begining of Vunble

set nocompatible		                " be iMproved, required
filetype off			                " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'bling/vim-airline'
" set airline to appear all the time
set laststatus=2

" formats to install plugins on Github
Plugin 'scrooloose/nerdtree'
" NERDTree toggle
map <C-n> :NERDTreeToggle<CR>
" change width of NERDTree (this is not working)
" let g:NERDTreeWinSize=30
" open NERDTree automatically when vim starts up
autocmd VimEnter * NERDTree | wincmd p
" open NERDTree automatically when vim starts up with no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" set right side NERDTree
" let g:NERDTreeWinPos="right"
let g:NERDTreeWinSize=30
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Plugin 'ervandew/supertab'

Plugin 'kien/ctrlp.vim'
"let g:ctrlp_map = '<c-p>'
"let g:ctrlp_cmd = 'CtrlP'

call vundle#end()		                " required
filetype plugin indent on	                " required
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Change cursor shape between insert and normal mode in iTerm2.app
" block(default) vs vertical bar
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"    " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"    " Block in normal mode
endif

