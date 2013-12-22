"
" pathogen Configuration
"
" execute pathogen#infect()

"
" Vundler Configuration
"
set nocompatible              " be iMproved
filetype off

set rtp+=$HOME/.vim/bundle/vundle/
call vundle#rc('$HOME/.vim/')
" let Vundle manage Vundle
" " required! 
"
" " My bundles here:
" "
" " original repos on GitHub
Bundle 'gmarik/vundle'
Bundle 'tomasr/molokai'
Bundle 'tpope/vim-pathogen'
Bundle 'scrooloose/nerdtree'
Bundle 'wesleyche/SrcExpl'
Bundle 'vim-scripts/taglist.vim'
Bundle 'vim-scripts/OmniCppComplete'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'

Bundle 'AutoComplPop'
Bundle 'SuperTab'
Bundle 'a.vim'
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

set tabstop=4
set shiftwidth=4
set softtabstop=4
set history=1000
set backspace=2
"set encoding=utf-8
"set fileencoding=cp949

if has("gui_running")
    set guifont=Monaco:h10:cANSI
	au GUIEnter * simalt ~x
endif

"
" NERDTree Configuration
"
"autocmd vimenter * NERDTree
"autocmd vimenter * if !argc() | NERDTree | endif
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
nmap <F5> :NERDTreeToggle<cr>
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
" OmniCppComplete
"
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#CompleteCpp
