"
" Vundler Configuration
"
set nocompatible              " be iMproved
filetype off

set runtimepath+=$HOME/.vim/bundle/vundle/
call vundle#rc('$HOME/.vim/bundle')
" let Vundle manage Vundle
" " required! 
"
" " My bundles here:
" "
" " original repos on GitHub
Bundle 'gmarik/vundle'
Bundle 'tomasr/molokai'
Bundle 'scrooloose/nerdtree'
Bundle 'wesleyche/SrcExpl'
Bundle 'vim-scripts/taglist.vim'
Bundle 'vim-scripts/OmniCppComplete'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'
Bundle 'AutoComplPop'
Bundle 'a.vim'
Bundle 'cpp.vim'
Bundle 'artoj/qmake-syntax-vim'
"Bundle 'SuperTab'
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

"
" VIM configuration
"
syntax on
filetype plugin indent on

colors molokai
set number
set expandtab

" 
" Search
"
set hls
set magic
set showmatch
set ignorecase
set smartcase
set incsearch
set mouse=a

set nocompatible
set tabstop=2
set shiftwidth=2
set softtabstop=2
set history=1000
set backspace=2
"set encoding=utf-8
"set fileencoding=cp949

if has("gui_running")
  set guifont=Monaco:h9:cANSI
	au GUIEnter * simalt ~x
endif

"
" a.vim Configuration
"
nmap <F4> :A<cr>

"
" NERDTree Configuration
"
"autocmd vimenter * NERDTree
"autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
nmap <C-n> :NERDTreeToggle<cr>
let NERDTreeWinPos="left"

"
" TagList Configuration
"
" autocmd vimenter * Tlist 
nmap <F6> :TlistToggle<cr>
"let Tlist_CTags_Cmd="/opt/local/bin/ctags"
let Tlist_Inc_Winwidth = 0
let Tlist_Exit_OnlyWindow = 0
let Tlist_Auto_Open = 0
let Tlist_Use_Right_Window = 1

"
" SrcExpl Configuration
"
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

"
" OmniCppComplete Configuration
"
set tags+=$HOME/.vim/tags/qt5
au BufNewFile,BufRead,BufEnter *.cpp,*.hpp set omnifunc=omni#cpp#complete#Main
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview
map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
"map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ -f .<CR>

" insert gate when create new header file. 
function! s:insert_gates()
  let gatename = substitute(toupper(expand("%:t")), "\\.", "_", "g")
  execute "normal! i#ifndef " . gatename
  execute "normal! o#define " . gatename . " "
  execute "normal! Go#endif /* " . gatename . " */"
  normal! kk
endfunction
autocmd BufNewFile *.{h,hpp} call <SID>insert_gates()

" Vim syntax highlighting for Qt's .pro files
au BufNewFile,BufRead *.pro set filetype=qmake
