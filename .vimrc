"for installing plugins easily
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
filetype plugin indent on

"basic formatting / display options
syntax on
set nu
hi comment ctermfg=blue
hi Search cterm=NONE ctermfg=grey ctermbg=blue

"whitespace management
set shiftwidth=4 tabstop=4 expandtab
autocmd BufWritePre *.py :%s/\s\+$//e

"for inserting blank lines
map <Enter> O<ESC>

"margin display
":set colorcolumn=80
:set hlsearch
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => less opinionated vimrc for use on other systems
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible
set number
filetype off

call plug#begin('~/.vim/plugged')

Plug 'janko-m/vim-test'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter',
Plug 'kien/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'itchyny/lightline.vim'
Plug 'bling/vim-bufferline'
Plug 'airblade/vim-gitgutter'
Plug 'Raimondi/delimitMate'
Plug 'terryma/vim-multiple-cursors'
Plug 'sjl/vitality.vim'
Plug 'sickill/vim-pasta'

" language specific plugins
Plug 'klen/python-mode', { 'for': 'python' }
Plug 'tpope/vim-markdown', { 'for': 'markdown' }
let test#python#runner = 'pytest'

call plug#end()

"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => GUI Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" nvim truecolor settings
let base16colorspace=256  " Access colors present in 256 colorspace"
set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors"

set background=dark
set cursorline

filetype indent plugin on
:inoremap jj <Esc>

set scrolloff=7 " set 7 lines to the cursors - when moving vertical
set wildmenu " enhanced command line completion
set hidden " current buffer can be put into background
set showcmd " show incomplete commands
set wildmode=list:longest,full " complete files like a shell

set title " set terminal title

" Searching
set ignorecase " case insensitive searching
set smartcase " case-sensitive if expresson contains a capital letter
set hlsearch
set incsearch " set incremental search, like modern browsers

set magic " Set magic on, for regex

set showmatch " show matching braces
set mat=2 " how many tenths of a second to blink

" error bells
set noerrorbells
set visualbell
set t_vb=
set tm=500

" set leader key
let mapleader=","
let g:mapleader=","

" code folding settings
set foldmethod=syntax " fold based on indent
set foldnestmax=10 " deepest fold is 10 levels
set nofoldenable " don't fold by default
set foldlevel=1

" linewrap settings
set wrap linebreak nolist
set showbreak=+++
set textwidth=0
set wrapmargin=0
set colorcolumn=80

" syntax highlighting on
syntax on

" mouse settings
set mouse=a

" indentation settings
set autoindent " Auto-indent new lines
set shiftwidth=4 " Number of auto-indent spaces
set smartindent	" Enable smart-indent
set smarttab " Enable smart-tabs
set softtabstop=4 " Number of spaces per Tab

" more responsive vim
set ttyfast
set notimeout
set lazyredraw

" save when focus lost
au FocusLost * :wa

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NERDtree settings
noremap <Leader>n :NERDTreeToggle<CR>
let g:NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.pyc$']
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ctrlp settings
let g:ctrlp_dotfiles=1
let g:ctrlp_working_path_mode = 'ra'

" Fugitive settings
nmap <silent> <leader>gs :Gstatus<cr>
nmap <leader>ge :Gedit<cr>
nmap <silent><leader>gr :Gread<cr>
nmap <silent><leader>gb :Gblame<cr>

" python-mode settings
let g:pymode_lint_cwindow = 0
let g:pymode_lint_unmodified = 1
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope_goto_definition_bind = "<C-]>"

" Ack.vim settings
noremap <leader>a :Ack<Space>
if executable('ag')
  let g:ackprg = 'ag --vimrep'
endif

" colorschemes
colorscheme apprentice

