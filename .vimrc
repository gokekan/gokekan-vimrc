" Vundler Configuration{{{
set nocompatible              " be iMproved
filetype off

" Runtime PATH 
set runtimepath+=$HOME/.vim/bundle/vundle/
call vundle#rc('$HOME/.vim/bundle')

" Vundle Manager  
Bundle 'gmarik/vundle'

" Color Scheme Plugin
Bundle 'tomasr/molokai'

" User Interface Plugin
Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/nerdtree'
Bundle 'xolox/vim-shell'
Bundle 'xolox/vim-misc'


" Programming Plu{gin 
Bundle 'wesleyche/SrcExpl'
Bundle 'vim-scripts/taglist.vim'
Bundle 'Rip-Rip/clang_complete'
Bundle 'a.vim'
Bundle 'cpp.vim'
Bundle 'octol/vim-cpp-enhanced-highlight'
Bundle 'artoj/qmake-syntax-vim'
Bundle 'msanders/snipmate.vim'
Bundle 'aperezdc/vim-template'
Bundle 'vim-scripts/restore_view.vim'
Bundle 'vim-scripts/DoxygenToolkit.vim'

" Unclassified Plugin
" Bundle 'deremcoughlin/gvimfullscreen_win32'
" Bundle 'ervandew/supertab'
" Bundle 'vim-scripts/OmniCppComplete'
" Bundle 'MarcWeber/vim-addon-mw-utils'
" Bundle 'tomtom/tlib_vim'
" Bundle 'garbas/vim-snipmate'
" Bundle 'honza/vim-snippets'
" Bundle 'AutoComplPop'
" Bundle 'Shougo/neocomplcache.vim'
" Bundle 'SuperTab-continued'
" Bundle 'swinman/taghighlight'
" Bundle 'vim-scripts/EasyColour'
" Bundle 'mbbill/code_complete'

"}}}

" VIM configuration {{{
syntax on
filetype plugin indent on
colors molokai
set foldmethod=marker
set number
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set history=1000
set backspace=2

"set encoding=euc-kr
"set fileencoding=utf-8

" Search Configuration
set hlsearch 
set magic
set showmatch
set ignorecase
set smartcase
set incsearch
set mouse=a
"}}}

" GUI Configuration {{{
if has("gui_running")
    set guifont=Monaco:h9:cANSI
"    au GUIEnter * simalt ~x " Maximized Windows
"    set guioptions-=m
"    set guioptions-=T
"    set guioptions-=LlRrb
    set guioptions=Ace
endif
"}}}

" vimrc auto update {{{
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC "| if has('gui_running') | so $MYGVIMRC | endif
augroup END
"}}}

" restore_view.vim configuration {{{
set viewdir=$HOME\.vim\view
set viewoptions=cursor,folds,slash,unix 
" let g:skipview_files = ['*\.vim'] 
"}}}

" NERDTree Configuration{{{
"autocmd vimenter * NERDTree
"autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeWinPos="left"
"}}}

" TagList Configuration{{{
" autocmd vimenter * Tlist 
"let Tlist_CTags_Cmd="/opt/local/bin/ctags"
let Tlist_Inc_Winwidth = 0
let Tlist_Exit_OnlyWindow = 0
let Tlist_Auto_Open = 0
let Tlist_Use_Right_Window = 1
"}}}

" SrcExpl Configuration{{{
" autocmd vimenter * SrcExpl
nmap <C-H> <C-W>h
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-L> <C-W>l
let g:SrcExpl_winHeight = 9
let g:SrcExpl_refreshTime = 100
let g:SrcExpl_jumpKey = "<ENTER>"
let g:SrcExpl_gobackKey = "<SPACE>"
let g:SrcExpl_isUpdateTags = 0
"}}}

" C/C++ programming helpers {{{
augroup csrc
  au!
  autocmd FileType *      set nocindent smartindent
  autocmd FileType c,cpp  set cindent
augroup END
"}}}

" clang_complete {{{ 
" Complete options (disable preview scratch window)
set completeopt=menu,menuone,longest
" Limit popup menu height
set pumheight=15
" SuperTab option for context aware completion
"let g:SuperTabDefaultCompletionType = "context"
" Disable auto popup, use <Tab> to autocomplete
let g:clang_complete_auto = 1
" Show clang errors in the quickfix window
let g:clang_complete_copen = 1
let g:clang_exec = 'C:\Program Files (x86)\LLVM\bin\clang.exe'
let g:clang_library_path = 'C:\Program Files (x86)\LLVM\bin'
let g:clang_use_library = 1
let g:clang_snippets=1
let g:clang_conceal_snippets=1
" The single one that works with clang_complete
let g:clang_snippets_engine='clang_complete'
"}}}

" OmniCppComplete Configuration {{{
"set tags+=$HOME/.vim/tags/qt5
"set tags+=$HOME/.vim/tags/opencv
"set tags+=$HOME/.vim/tags/dainet-sdk
"au BufNewFile,BufRead,BufEnter *.cpp,*.hpp set omnifunc=omni#cpp#complete#Main
"let OmniCpp_NamespaceSearch = 2
"let OmniCpp_GlobalScopeSearch = 1
"let OmniCpp_ShowAccess = 1
"let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
"let OmniCpp_ShowScopeInAbbr = 1
"let OmniCpp_MayCompleteDot = 1 " autocomplete after .
"let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
"let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
"let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
"au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
"set completeopt=menuone,menu,longest,preview
"}}}

" Vim Syntax Highlighting for Qt's .pro files {{{
au BufNewFile,BufRead *.pro set filetype=qmake
"}}}

" Cscope {{{
map <C-F11> :!cscope -b -R
map <C-F10> :cs add .\cscope.output
"}}}

" Mapping {{{
nmap <F1> <ESC>:vert help 
nmap <F4> :A<cr>
nmap <F5> :NERDTreeToggle<cr>
nmap <F6> :TlistToggle<cr>
nmap <F7> :SrcExplToggle<CR>
"map <F11> <Esc> :call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR> 
map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
"map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ -f .<CR>
inoremap <F9> <C-O>za
nnoremap <F9> za
onoremap <F9> <C-C>za
vnoremap <F9> zf
"}}}

" DoxygenToolkit {{{
"let g:DoxygenToolkit_briefTag_pre="@Synopsis "
let g:DoxygenToolkit_paramTag_pre="@Param "
let g:DoxygenToolkit_returnTag="@Returns "
"let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------"
"let g:DoxygenToolkit_blockFooter="----------------------------------------------------------------------------"
let g:DoxygenToolkit_authorName="Hyeonate Kim(gokekan@naver.com)"
let g:DoxygenToolkit_licenseTag="My own license <enter>"
"}}}
