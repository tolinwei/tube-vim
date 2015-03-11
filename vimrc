" General syntax
syntax on
set number
colorscheme gruvbox
set background=dark
set number

set backspace=indent,eol,start

" http://vim.wikia.com/wiki/Indenting_source_code
set expandtab	        " When press <TAB> key, insert 'softtabstop' amount of space
set shiftwidth=4	" Affects when press >>, << or ==
set softtabstop=4	" Set it the same sa shiftwidth when using SPACE indention
			" , default value is the same as 'tabstop'
set smartindent         " Copy indentation from previous line
                        " , and add extra level in some cases
set nowrap              " Don't wrap lines
" Delete all trailing whitespaces on save
autocmd BufWritePre * :%s/\s\+$//e


" 80 words onwards as "warning" and 120 words as "danger"
" for both industry standard (80 columns) and Yahoo standards (120 columns)
if exists('+colorcolumn')
    let &colorcolumn="81,".join(range(121,999),",")
    " execute "set colorcolumn=" . join(range(121,999), ',')  " Also works
    " set colorcolumn=81
else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>81v.\+', -1)
endif


" The begining of Vunble

set nocompatible	" be iMproved, required
filetype off		" required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" formats to install plugins on Github
Plugin 'scrooloose/nerdtree'
" NERDTree toggle
map <C-n> :NERDTreeToggle<CR>

Plugin 'bling/vim-airline'

" Plugin 'scrooloose/syntastic'
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" let g:syntastic_java_checkers = ['checkstyle']
" let g:syntastic_java_checkstyle_classpath = "/Users/linwei/.vim/checkstyle-6.3-all.jar"

" Plugin 'ervandew/supertab'

Plugin 'kien/ctrlp.vim'
"let g:ctrlp_map = '<c-p>'
"let g:ctrlp_cmd = 'CtrlP'

call vundle#end()	    " required
filetype plugin indent on   " required

" Change cursor shape between insert and normal mode in iTerm2.app
" block(default) vs vertical bar
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif
