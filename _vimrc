" Language, Encoding {{{

" 한글 출력을 위해서는 언어 및 인코딩 관련 셋팅은 vimrc 가장 위에 적어준다.
" 윈도우 운영체제인 경우에는 위에 명시하지 않으면 메뉴와 각종 메시지들이
" 외계어로 나온다
set enc=utf-8 
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp949,latin1

" VIM 7.3 for Windows
let $LANG = 'ko_KR.UTF-8'
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
" }}}

set nocompatible
filetype off

set rtp+=~/vimfiles/bundle/Vundle.vim
let path='~/vimfiles/bundle'

" Vundler {{{
call vundle#begin(path)

" Vundle Plugin
Plugin 'VundleVim/Vundle.vim'   " 패키지 매니저
Plugin 'tpope/vim-fugitive'     " 버전관리툴인 Git와 연관된 패키지
Plugin 'L9'                     " VIM-Script 라이브러리

" Color Scheme
Plugin 'tpope/vim-vividchalk'
Plugin 'tomasr/molokai'
Plugin 'vim-scripts/candy.vim'
Plugin 'nanotech/jellybeans.vim'

" Font
Plugin 'powerline/fonts'

" Programming
Plugin 'rstacruz/sparkup'        " HTML Code Writer
" Plugin 'SirVer/ultisnips'
" Plugin 'OmniSharp/omnisharp-vim' " C-Sharp Auto Complete 
" Plugin 'Rip-Rip/clang_complete'  " C++ Auto Complete

" Edit
Plugin 'tomtom/tcomment_vim'     " comment plugin
Plugin 'godlygeek/tabular'       " text filtering and alignment
Plugin 'nathanaelkane/vim-indent-guides'    " indent guides

" Utility
Plugin 'scrooloose/nerdtree' " File explorer 
Plugin 'restore_view.vim'    " store view
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-dispatch'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'

" Interface
Plugin 'mkitt/tabline.vim'

call vundle#end()
" }}}

filetype plugin indent on
syntax on

colors molokai

set number          " 줄번호를 보여준다
set foldmethod=marker

" Input {{{
set expandtab       " 탭 문자륵 공백문자로 전환
set tabstop=4       " 탭 간격
set shiftwidth=4    " 들여쓰기 간격

" 탭 가격을 공백문자로 변환하여 삭제할 때,
" 탭 간격만큼 삭제하지 않고, 마치 탭 문자를 삭제하는 것 처럼 설정하며, 
" 두칸단위로 삭제함
set softtabstop=4   

" 줄의 끝, 시작, 들여쓰기에서 백스페이스를 사용하면 이전 줄과 연결된다
set backspace=eol,start,indent
" }}}

set history=1000
set hlsearch
set noshowmatch
set completeopt=longest,menuone,preview
set splitbelow

" set ignorecas
set smartcase
set incsearch
set mouse=a
set noswapfile
set laststatus=2    " need vim-airline 

" GUI Configuation {{{
if has('gui_running')
    set gfn=monofur\ for\ Powerline:h11
    set gfw=Dotumche:h10:cDEFAULT
"   lang mes en_US
"   au GUIEnter * simalt -x " Maximized WIndows
"   set guioptions -=m
    set guioptions -=T
    set guioptions -=L
    set guioptions -=l
    set guioptions -=R
    set guioptions -=r
    set guioptions -=b
    set guioptions -=e
"   set linespace=5
endif
" }}}

" vimrc 저장 시, vimrc를 다시 로드한다
augroup reload_vimrc 
	autocmd!
	autocmd BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC "| if has('gui_running') | so $MYVIMRC | endif
    autocmd FileType * :AirlineRefresh
augroup END

au BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \ exe "norm g`\"" |
            \ endif

" restore_view.vim 
set viewdir=~/.vim/view
set viewoptions=cursor,folds,slash,unix
let g:skipview_files = ['*\.vim']


" NERDTree Configuration
let NERDTreeWinPos='left'
map <F2> :NERDTreeToggle<CR>

" vim-airline Configuration {{{
if !exists('g:airline_symbols')
   let g:airline_symbols = {}
endif

let g:airline_theme='dark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
" }}}

let g:EclimCompletionMethod = 'omnifunc'

