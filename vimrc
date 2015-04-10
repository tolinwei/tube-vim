""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""
" Color scheme
syntax on
set background=dark
colorscheme gruvbox
""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""
" General setting	                        " http://vim.wikia.com/wiki/Indenting_source_code
set number
set backspace=indent,eol,start
set softtabstop=4		                " Set it the same sa shiftwidth when using SPACE indention
                                                " , default value is the same as 'tabstop'
set shiftwidth=4		                " Affects when press >>, << or ==
set expandtab			                " When press <TAB> key, insert 'softtabstop' amount of space
set smartindent                                 " Copy indentation from previous line
                                                " , and add extra level in some cases
set nowrap                                      " Don't wrap lines
set hlsearch
set cursorline
set clipboard=unnamed                           " Make yank and pasge working between Vims
""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""
" Folding
set foldmethod=indent	                        " http://vim.wikia.com/wiki/All_folds_open_when_opening_a_file
set foldlevelstart=20                           " files will be loaded with opend folds
""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufWritePre * :%s/\s\+$//e              " Delete all trailing whitespaces on save
""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                                                " 80 words onwards as "warning" and 120 words as "danger"
                                                " For both industry standard (80 columns) and Yahoo standards (120 columns)
if exists('+colorcolumn')
    let &colorcolumn="81,".join(range(121,999),",")
else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>81v.\+', -1)
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""
" The begining of Vunble
""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible		                " be iMproved, required
filetype off			                " Required, open later
set rtp+=~/.vim/bundle/Vundle.vim	        " Set the runtime path to include Vundle and initialize
call vundle#begin()	                        " Let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'tolinwei/vim-airline'
""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2	                        " Set airline to appear all the time
set timeoutlen=50	                        " Remove the pause when leaving insert mode
" let g:airline_theme='badwolf'	                " Load theme at startup
let g:airline_theme='tomorrow'
""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'scrooloose/nerdtree'
""""""""""""""""""""""""""""""""""""""""""""""""
map <C-n> :NERDTreeToggle<CR>	                " NERDTree toggle
" autocmd VimEnter * NERDTree | wincmd p	" Open NERDTree automatically when vim starts up
                                                " Open NERDTree automatically when vim starts up with no files specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" let g:NERDTreeWinPos="right"	                " set right side NERDTree
let g:NERDTreeWinSize=40
""""""""""""""""""""""""""""""""""""""""""""""""
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
function! s:CloseIfOnlyNerdTreeLeft()	        " Close all open buffers on entering a window if the only
                                                " buffer that's left is the NERDTree buffer
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction
""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'nathanaelkane/vim-indent-guides'
""""""""""""""""""""""""""""""""""""""""""""""""
let g:indent_guides_enable_on_vim_startup=1	" Startup vim-indent-guides with vim
let g:indent_guides_guide_size=1	        " set width
""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'majutsushi/tagbar'	                " Need to install Exuberant Ctags before usage
                                                " http://ctags.sourceforge.net/
""""""""""""""""""""""""""""""""""""""""""""""""
nmap <C-t> :TagbarToggle<CR>
let g:tagbar_width=50	                        " Set width
                                                " Open tagbar when open Vim with supported file/files
" autocmd VimEnter * nested :call tagbar#autoopen(1)
""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'kien/rainbow_parentheses.vim'
""""""""""""""""""""""""""""""""""""""""""""""""
let g:rbpt_max=16
let g:rbpt_loadcmd_toggle=0
au VimEnter * RainbowParenthesesToggle	        " Always on
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadRound
""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'jiangmiao/auto-pairs'
""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'ervandew/supertab'
""""""""""""""""""""""""""""""""""""""""""""""""
" let g:SuperTabDefaultCompletionType = "<C-n>"	" Naviagete the completion menu from top to bottom
""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin 'scrooloose/syntastic'	                " not suitable for benzene
""""""""""""""""""""""""""""""""""""""""""""""""
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""
Bundle 'yonchu/accelerated-smooth-scroll'
""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""
call vundle#end()		                " required for Vundle
filetype plugin indent on	                " required for Vundle
""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                                                " Change cursor shape between insert and normal mode in iTerm2.app
                                                " block(default) vs vertical bar
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"    " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"    " Block in normal mode
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

