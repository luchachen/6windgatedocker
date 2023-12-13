"set nocompatible              " be iMproved, required
filetype off                  " required
au!

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/bundle')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'google/vim-colorscheme-primary'
"Plugin 'altercation/vim-colors-solarized'
"Plugin 'nanotech/jellybeans.vim'
Plugin 'google/vim-searchindex'

" Add maktaba and codefmt to the runtimepath.
" " (The latter must be installed before it can be used.)
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
"Plugin 'zxqfl/tabnine-vim'
"Plugin 'tbodt/deoplete-tabnine', { 'do': './install.sh' }

" " Also add Glaive, which is used to configure codefmt's maktaba flags. See
" " `:help :Glaive` for usage.
"Plugin 'google/vim-glaive'

"call glaive#Install()
" " Optional: Enable codefmt's default mappings on the <Leader>= prefix.
"Glaive codefmt plugin[mappings]

Plugin 'mhinz/vim-signify'
Plugin 'groovy.vim'
Plugin 'quickfix-reflector.vim'
Plugin 'chrisbra/csv.vim'
Plugin 'LogViewer'
Plugin 'javacomplete'
Plugin 'Valloric/YouCompleteMe'
"Plugin 'zxqfl/tabnine-vim'
Plugin 'SirVer/ultisnips'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'ronakg/quickr-cscope.vim'
Plugin 'naseer/logcat'
Plugin 'andreshazard/vim-logreview'
Plugin 'embear/vim-foldsearch'
Plugin 'gh:dzeban/vim-log-syntax.git'
Plugin 'gh:luchachen/vim-bugreport.git'

Plugin 'luchachen/vim-metacomment'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-airline/vim-airline'
Plugin 'jreybert/vimagit'
"uncompatible vim8.2
"Plugin 'tpope/vim-fugitive'
Plugin 'easymotion/vim-easymotion'


"
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line



map <C-K> :pyf <path-to-this-file>/clang-format.py<cr>
imap <C-K> <c-o>:pyf <path-to-this-file>/clang-format.py<cr>

set cursorline
set cursorcolumn
set hlsearch
set ignorecase
set number
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

syntax enable
"set foldcolumn=4
set t_Co=256
set background=dark
"set background=light
"colorscheme solarized
let g:solarized_termcolors=256
"colorscheme zellner
colorscheme  pablo
"colorscheme  jellybeans 
"highlight CursorLine ctermfg=red guifg=red
highlight WhitespaceEOL ctermbg=red guibg=red

au BufRead help mapc <buffer> 
match WhitespaceEOL /\s\+$/
nnoremap <C-K> :call HighlightNearCursor()<CR>
function HighlightNearCursor()
  if !exists("s:highlightcursor")
    match Todo /\k*\%#\k*/
    let s:highlightcursor=1
  else
    match None
    unlet s:highlightcursor
  endif
endfunction

" Auto-update GTags database from current file
let Gtags_Auto_Update = 0
let Gtags_Auto_Map = 1
let foldsearch_highlight = 1
"let Gtags_Use_Tags_Format = 1
" cscope
" set cscopetag                  " use cscope as tags cmd
" set cscopeprg='gtags-cscope'   " use gtags-cscope substitub cscope
"
"
" gtags
let GtagsCscope_Auto_Load = 1
let GtagsCscope_Auto_Map = 1
let GtagsCscope_Quiet = 1
"let cauthor = 'xxx'
"
let g:ycm_server_python_interpreter = '/usr/bin/python3'

