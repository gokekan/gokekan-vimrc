"---------------------------------------------
" Vundler Configuration
"---------------------------------------------
set nocompatible              " be iMproved
filetype off

set runtimepath+=$HOME/.vim/bundle/vundle/
call vundle#rc('$HOME/.vim/bundle')

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" Colors
Bundle 'tomasr/molokai'
Bundle 'vim-scripts/synic.vim'

" UI
Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/nerdtree'
Bundle 'wesleyche/SrcExpl'
Bundle 'vim-scripts/taglist.vim'

" C/C++ Programming
Bundle 'vim-scripts/OmniCppComplete'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
"Bundle 'garbas/vim-snipmate'
"Bundle 'honza/vim-snippets'
Bundle 'AutoComplPop'
"Bundle 'Shougo/neocomplcache.vim'
Bundle 'a.vim'
Bundle 'cpp.vim'
Bundle 'octol/vim-cpp-enhanced-highlight'
Bundle 'artoj/qmake-syntax-vim'
Bundle 'swinman/taghighlight'
Bundle 'vim-scripts/EasyColour'
Bundle 'mbbill/code_complete'
"Bundle 'ervandew/supertab'
"Bundle 'SuperTab-continued'

" " ...
"
" filetype plugin indent on     " required!
" "
" " Brief help
" " :BundleList          - list configured bundles
" " :BundleInstall(!)    - install (update) bundles
" " :BundleSearch(!) foo - search (or refresh cache first) for foo
" " :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
" "
" " see :h vundle for more details or wiki for FAQ
" " NOTE: comments after Bundle commands are not allowed.



"---------------------------------------------
" VIM configuration
"---------------------------------------------
syntax on
filetype plugin indent on

" Vim Colors 
colors molokai
"colors synic

set number
set expandtab
set nocompatible
set tabstop=4
set shiftwidth=4
set softtabstop=4
set history=1000
set backspace=2
"set encoding=euc-kr
"set fileencoding=utf-8

"---------------------------------------------
" Search Configuration
"---------------------------------------------
set hls
set magic
set showmatch
set ignorecase
set smartcase
set incsearch
set mouse=a

"---------------------------------------------
" GUI Configuration
"---------------------------------------------
if has("gui_running")
    set guifont=Monaco:h9:cANSI
    "au GUIEnter * simalt ~x
    
    set guioptions-=m
    set guioptions-=T
    set guioptions-=LlRrb
    set guioptions=Ace
endif

"---------------------------------------------
" VIMRC Update
"---------------------------------------------
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC "| if has('gui_running') | so $MYGVIMRC | endif
augroup END

"---------------------------------------------
" Full Screen
"---------------------------------------------
":autocmd GUIEnter * call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)
map <F11> <Esc> :call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR> 

"---------------------------------------------
" NERDTree Configuration
"---------------------------------------------
"autocmd vimenter * NERDTree
"autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
nmap <F5> :NERDTreeToggle<cr>
let NERDTreeWinPos="left"

"---------------------------------------------
" TagList Configuration
"---------------------------------------------
" autocmd vimenter * Tlist 
nmap <F6> :TlistToggle<cr>
"let Tlist_CTags_Cmd="/opt/local/bin/ctags"
let Tlist_Inc_Winwidth = 0
let Tlist_Exit_OnlyWindow = 0
let Tlist_Auto_Open = 0
let Tlist_Use_Right_Window = 1

"---------------------------------------------
" SrcExpl Configuration
"---------------------------------------------
" autocmd vimenter * SrcExpl
nmap <F7> :SrcExplToggle<CR>
nmap <C-H> <C-W>h
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-L> <C-W>l
let g:SrcExpl_winHeight = 9
let g:SrcExpl_refreshTime = 100
let g:SrcExpl_jumpKey = "<ENTER>"
let g:SrcExpl_gobackKey = "<SPACE>"
let g:SrcExpl_isUpdateTags = 0

"---------------------------------------------
" Optional
" C/C++ programming helpers
"---------------------------------------------
augroup csrc
  au!
  autocmd FileType *      set nocindent smartindent
  autocmd FileType c,cpp  set cindent
augroup END

"---------------------------------------------
" a.vim Configuration
"---------------------------------------------
nmap <F4> :A<cr>

"---------------------------------------------
" OmniCppComplete Configuration
"---------------------------------------------
set tags+=$HOME/.vim/tags/qt5
set tags+=$HOME/.vim/tags/opencv
set tags+=$HOME/.vim/tags/dainet-sdk
au BufNewFile,BufRead,BufEnter *.cpp,*.hpp set omnifunc=omni#cpp#complete#Main
let OmniCpp_NamespaceSearch = 2
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_ShowScopeInAbbr = 1
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
"let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview
map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
"map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ -f .<CR>

" Vim syntax highlighting for Qt's .pro files
au BufNewFile,BufRead *.pro set filetype=qmake

" Cscope
map <C-F11> :!cscope -b -R
map <C-F10> :cs add .\cscope.output
map <F1> <ESC>:vert help 


