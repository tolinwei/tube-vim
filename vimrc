""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color scheme
syntax on
set background=dark
colorscheme gruvbox
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General setting	                        " http://vim.wikia.com/wiki/Indenting_source_code
set number
set backspace=indent,eol,start
set tabstop=4
set softtabstop=4		                " Set it the same sa shiftwidth when using SPACE indention
                                                " , default value is the same as 'tabstop'
set shiftwidth=4		                " Affects when press >>, << or ==
set expandtab			                " When press <TAB> key, insert 'softtabstop' amount of space
set smartindent                                 " Copy indentation from previous line
                                                " , and add extra level in some cases
set nowrap                                      " Don't wrap lines
set hlsearch
set cursorline
set clipboard+=unnamed                          " Make yank and pasge working across Vims
                                                " http://vim.wikia.com/wiki/Word_wrap_without_line_breaks
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding
set foldmethod=indent	                        " http://vim.wikia.com/wiki/All_folds_open_when_opening_a_file
set foldlevelstart=20                           " files will be loaded with opend folds
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufWritePre * :%s/\s\+$//e              " Delete all trailing whitespaces on save
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 80 words onwards as 'warning' and 120 words as 'danger'
" For both industry standard (80 columns) and 120 columns above
if exists('+colorcolumn')
    let &colorcolumn="81,".join(range(121,999),",")
else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>81v.\+', -1)
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The begining of Vunble
""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible		                " be iMproved, required
filetype off			                " Required, open later
set rtp+=~/.vim/bundle/Vundle.vim	        " Set the runtime path to include Vundle and initialize
call vundle#begin()	                        " Let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'tolinwei/vim-airline'	                " forked repo to switch mode color of tomorrow theme
""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2	                        " Set airline to appear all the time
set timeoutlen=50	                        " Remove the pause when leaving insert mode
" let g:airline_theme='badwolf'	                " Load theme at startup
let g:airline_theme='tomorrow'
let g:airline#extensions#tagbar#enabled=0
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'scrooloose/nerdtree'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-n> :NERDTreeToggle<CR>
" Open NERDTree automatically when vim starts up
autocmd VimEnter * NERDTree | wincmd p
" Set NERDTree on right side, would be conflick with tagbar
"let g:NERDTreeWinPos="right"
let g:NERDTreeWinSize=30
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'nathanaelkane/vim-indent-guides'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Startup vim-indent-guides with vim
let g:indent_guides_enable_on_vim_startup=1
" Set width of vim-indent-guides
let g:indent_guides_guide_size=1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Need to install Exuberant Ctags before usage
" http://ctags.sourceforge.net/
Plugin 'majutsushi/tagbar'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <C-t> :TagbarToggle<CR>
" Set width
let g:tagbar_width=40
" Open tagbar when open Vim with supported file/files
"autocmd VimEnter * nested :call tagbar#autoopen(1)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'kien/rainbow_parentheses.vim'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:rbpt_max=16
let g:rbpt_loadcmd_toggle=0
" Always on
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'jiangmiao/auto-pairs'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'yonchu/accelerated-smooth-scroll'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'scrooloose/nerdcommenter'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader="."
" http://stackoverflow.com/questions/14226390/how-to-use-nerd-commenter-for-vim-how-to-use-leader-key
set timeout timeoutlen=1500
" Add extra space after comment symbol
let NERDSpaceDelims=1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin 'myusuf3/numbers.vim'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:numbers_exclude=['tagbar', 'nerdtree']
nnoremap <F3> :NumbersToggle<CR>
nnoremap <F4> :set nonumber!<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins used in neocomplete
Plugin 'tolinwei/javacomplete'
Plugin 'c9s/perlomni.vim'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'Shougo/neocomplete.vim'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use neocomplete
let g:neocomplete#enable_at_startup=1
" Use smartcase
let g:neocomplete#enable_smart_case=1

" Set minimum syntax keyword lengh
let g:neocomplete#sources#syntax#min_keyword_length=3
let g:neocomplete#lock_buffer_name_pattern='\*ku\*'

" Define fictionary
let g:neocomplete#sources#dictionary#dictionaries={
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \}

" Define keyword
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns={}
endif
let g:neocomplete#keyword_patterns['default']='\h\w*'

" Plugin key-mappings.
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Reduced original setting for reference only
" <TAB>: completion.
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
" inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
" inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" inoremap <expr><C-y>  neocomplete#close_popup()
" inoremap <expr><C-e>  neocomplete#cancel_popup()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Personal setting that is most close to Jetbrains IDE
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()."\<C-y>"
inoremap <expr><Tab> pumvisible() ? "\<C-y>" : "\<Tab>"
inoremap <expr><C-e>  neocomplete#cancel_popup()

" AutoComplPop like behavior. (Choose first option in PUM by default)
let g:neocomplete#enable_auto_select = 1

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" Added and supported by javacomplete plugin
autocmd FileType java setlocal omnifunc=javacomplete#Complete

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""
call vundle#end()		                " required for Vundle
filetype plugin indent on	                " required for Vundle
""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Change cursor shape between insert and normal mode in iTerm2.app
" block(default) vs vertical bar
if $TERM_PROGRAM =~ "iTerm"
    " Vertical bar in insert mode
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    " Block in normal mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

