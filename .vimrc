set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"Plugin manager && look'n'feel:
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'flazz/vim-colorschemes'
"utilities:
Plugin 'myusuf3/numbers.vim'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdcommenter'
"better navigation:
Plugin 'wincent/Command-T'
Plugin 'easymotion/vim-easymotion'
"quasi-lispy:
Plugin 'jiangmiao/auto-pairs'
Plugin 'wlangstroth/vim-racket'
Plugin 'kien/rainbow_parentheses.vim'
"prose related:
Plugin 'reedes/vim-pencil'

call vundle#end()
filetype plugin indent on

"" general config:

set background=dark " helps setting the right contrast
colorscheme solarized
set history=1000
syntax on
setglobal fileencoding=utf-8 bomb
set encoding=utf-8
let $LANG = 'en_US'
set nocompatible        " so it's Vim and not Vi
set scrolloff=5         " start scrolling five lines below the border
set hidden              " hides buffers instead of closing them
set tabstop=8
set softtabstop=8
set shiftwidth=8
set backspace=indent,eol,start "intuitive backspaceing
set autoread            " if file changed outside of Vim, change without asking
set expandtab           " tabs are converted to spaces
set number              " shows number of the column
set showcmd             " display incomplete command
set ruler               " creates a line where cursor is
set ttyfast             " sayed to speed things up a little bit
set autoindent          " well, auto-indent
set cursorline          " sets line on the one where the cursor is
set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set ignorecase          " searches are case insensitive...
set smartcase           " ...unless it's beginning of the word
set novisualbell        " no beeping
set noerrorbells        " no beeping
set nobackup
set noswapfile
set undodir=~/.vim/vim-tmp/
set wildmenu            " this and the following set proper autocompition.
set textwidth=83        " sets text width (surprise)
set wildmode=list:longest
set laststatus=2
set nostartofline
set shell=zsh
set splitright          " new vertical split will be started to right
" gVim specific settings:
set ghr=0
set guioptions+=m
set guioptions+=a
set guioptions+=i
set guioptions-=T
set guioptions-=r
set guioptions-=l
set guioptions-=b
set guifont=Inconsolata\ Go\ 25

" jump to the last cursor position

  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

" Plugins behaviour:

let g:pencil#autoformat = 1
let g:pencil#textwidth = 93

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
    \ ['gray',        'RoyaBlue3'],
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
"" always on
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"" Key remaps and custom functions
" own remaps

inoremap fd <Esc>
inoremap df <Esc>
nnoremap ; :
nnoremap : ;
nnoremap ` '
nnoremap ' `
let mapleader=" "
map Y y$
imap <C-\> λ
nnoremap <F7> :TogglePencil <CR>
nnoremap <Backspace> :nohlsearch<CR>
nnoremap <Leader>d :bd<CR>
nnoremap <Leader><Leader> <C-^>
nnoremap <leader>r :call RenameFile()<cr>
nnoremap <C-e> 5<C-e>
nnoremap <C-y> 5<C-y>

"" Easymotion configuration:

" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" Better split switching
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" double %% magic - envoked in command-mode, returns current dir:
cnoremap <expr> %% expand('%:h').'/'

" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.

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

" RENAME CURRENT FILE

function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
