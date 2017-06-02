set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" Plugin manager && looks:
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'flazz/vim-colorschemes'
" utilities:
Plugin 'justinmk/vim-sneak'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-unimpaired'
Plugin 'roman/golden-ratio'
" better navigation:
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-vinegar'
" lispy:
Plugin 'wlangstroth/vim-racket'
Plugin 'kien/rainbow_parentheses.vim'
call vundle#end()
filetype plugin indent on

"" general config:

" colors:
if has("termguicolors")
        set termguicolors
endif

set background=light
colorscheme solarized8_light_flat

set history=10000
syntax enable
setglobal fileencoding=utf-8 bomb
set encoding=utf-8
let $LANG='en_US'
set scrolloff=5         " Start scrolling five lines to the border
set hidden              " Hides buffers instead of closing them
set tabstop=8
set softtabstop=8
set shiftwidth=8
set expandtab           " Tabs are converted to spaces
set backspace=indent,eol,start
set autoread            " If file changed outside of Vim, change without asking
set relativenumber      " Sets relative line numbering
set nonumber
set showcmd             " Display incomplete command
set autoindent          " An auto-indent
set lisp                " for lisp magic to happen
set nocursorline          " Sets line on the one where the cursor is
set showmatch           " Highlight matching [{()}]
set incsearch           " Search as characters are entered
set hlsearch            " Highlight matches
set ignorecase          " Searches are case insensitive...
set smartcase           " ...unless it's beginning of the word
set novisualbell        " No beeping
set noerrorbells        " No beeping
set nobackup            " Don't do backup
set nowritebackup
set wildmenu            " Set proper autocompition.
set path+=**            " enable recursive searching
set wildmode=list:longest
set laststatus=2
set nostartofline
set shell=zsh
set splitright          " new vertical split will be started to right


" jump to the last cursor position
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif


"" Key remaps and custom functions

inoremap fd <Esc>
nnoremap ; :
nnoremap : ;

map <Space> \
map Y y$
nnoremap <Leader><TAB> <C-^>
nnoremap <Backspace> :nohlsearch<CR>
nnoremap <Leader>o :only<CR>

nnoremap <Leader>b :CtrlPBuffer<CR>
nnoremap <Leader>m :CtrlPMRU<CR>
nnoremap <Leader>p :CtrlP<CR>

" Better split switching
nnoremap J <C-W>j
nnoremap K <C-W>k
nnoremap H <C-W>h
nnoremap L <C-W>l


" Emacs commands in insert mode:
inoremap <C-A> <Home>
inoremap <C-B> <Left>
inoremap <C-E> <End>
inoremap <C-F> <Right>
inoremap <C-B> <Left>
inoremap <C-K> <Esc>lDa
inoremap <C-U> <Esc>d0xi
inoremap <C-Y> <Esc>Pa


" double %% magic - envoked in command-mode, returns current directory
cnoremap <expr> %% expand('%:h').'/'

" MULTIPURPOSE TAB KEY - indent if we're at the beginning of a line. Else, do completion.

function! InsertTabWrapper()
        let col = col('.') - 1
        if !col || getline('.')[col - 1] !~ '\k'
            return "\<tab>"
        else
            return "\<c-p>"
        endif
endfunction

inoremap <expr> <tab> InsertTabWrapper()
inoremap <s-tab> <c-n>

"" Plugins setup and varia

" vim-sneak config
let g:sneak#label = 1
let g:sneak#s_next = 1

" airline settings
let g:airline#extensions#tabline#enabled = 0
let g:airline_right_sep=''
let g:airline_left_sep=''
let g:airline#extensions#whitespace#enabled = 0

" Rainbow parentheses config
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
" rainbow always on
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

