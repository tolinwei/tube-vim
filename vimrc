""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color scheme
syntax on
set background=dark
colorscheme gruvbox
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General setting
set number
set backspace=indent,eol,start
" http://vim.wikia.com/wiki/Indenting_source_code
set shiftwidth=4		                " Affects when press >>, << or ==
set softtabstop=4		                " Set it the same sa shiftwidth when using SPACE indention
                                                " , default value is the same as 'tabstop'
set expandtab			                " When press <TAB> key, insert 'softtabstop' amount of space
set smartindent                                 " Copy indentation from previous line
                                                " , and add extra level in some cases
set nowrap                                      " Don't wrap lines
set hlsearch
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding
" http://vim.wikia.com/wiki/All_folds_open_when_opening_a_file
set foldmethod=indent
set foldlevelstart=20                           " files will be loaded with opend folds
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufWritePre * :%s/\s\+$//e              " Delete all trailing whitespaces on save
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 80 words onwards as "warning" and 120 words as "danger"
" For both industry standard (80 columns) and Yahoo standards (120 columns)
if exists('+colorcolumn')
    let &colorcolumn="81,".join(range(121,999),",")
else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>81v.\+', -1)
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The begining of Vunble
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible		                " be iMproved, required
filetype off			                " Required, open later
" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'altercation/vim-colors-solarized'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'bling/vim-airline'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set airline to appear all the time
set laststatus=2
" Remove the pause when leaving insert mode
set timeoutlen=50
" Load theme at startup
let g:airline_theme='badwolf'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'scrooloose/nerdtree'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree toggle
map <C-n> :NERDTreeToggle<CR>
" Change width of NERDTree (this is not working)
" Let g:NERDTreeWinSize=30
" Open NERDTree automatically when vim starts up
autocmd VimEnter * NERDTree | wincmd p
" Open NERDTree automatically when vim starts up with no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" set right side NERDTree
" let g:NERDTreeWinPos="right"
let g:NERDTreeWinSize=40
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
Plugin 'nathanaelkane/vim-indent-guides'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Startup vim-indent-guides with vim
let g:indent_guides_enable_on_vim_startup=1
" set width
let g:indent_guides_guide_size=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Need to install Exuberant Ctags before usage
" http://ctags.sourceforge.net/
Plugin 'majutsushi/tagbar'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <C-t> :TagbarToggle<CR>
" Set width
let g:tagbar_width=50
" Open tagbar when open Vim with supported file/files
" autocmd VimEnter * nested :call tagbar#autoopen(1)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'vim-scripts/restore_view.vim'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin 'Valloric/YouCompleteMe'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call vundle#end()		                " required
filetype plugin indent on	                " required
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Change cursor shape between insert and normal mode in iTerm2.app
" block(default) vs vertical bar
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"    " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"    " Block in normal mode
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

