set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'tpope/vim-vinegar'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-surround'
Plugin 'jiangmiao/auto-pairs' 
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'wlangstroth/vim-racket'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'reedes/vim-pencil'
Plugin 'wincent/Command-T'

call vundle#end()            " required
filetype plugin indent on    " required

set background=dark " helps setting the right contrast
colorscheme solarized
set history=1000
syntax on
setglobal fileencoding=utf-8 bomb
set encoding=utf-8
let $LANG = 'en_US'
set nocompatible        " never change that
set scrolloff=5         " start scrolling five lines below the border
set hidden              " hides buffers instead of closing them
set tabstop=8
set softtabstop=8
set shiftwidth=8
set backspace=indent,eol,start  "intuitive backspaceing
set autoread            " if file changed outside of Vim change without asking
set expandtab           " tabs are converted to spaces
set relativenumber      " shows number of the column
set showcmd             " display incomplete command
set ruler               " creates a line where cursor is
set ttyfast             " sayed to speed thing up a little bit
set autoindent          " well, auto-indent:)
set cursorline          " sets line on the one where the cursor is
set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set ignorecase          " searches are case insensitive...
set smartcase           " unless it's beginning of the word
set novisualbell        " no beeping
set noerrorbells        " no beeping
set undodir=~/.vim/vim-tmp,/var/tmp,/tmp
set backupdir=~/.vim/vim-tmp,/var/tmp,/tmp
set directory=~/.vim/vim-tmp,/var/tmp,/tmp
set wildmenu            " this and the following set autocompition.
set wildmode=list:longest
set guioptions-=menu
set guioptions-=toolbar
set guifont=Inconsolata\ Go\ 23
set laststatus=2
set nostartofline 
set shell=zsh

" jump to the last cursor position

  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

" double %% magic

cnoremap <expr> %% expand('%:h').'/'

" Plugins behaviour:

let g:airline#extensions#tabline#enabled = 1
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
"" always on
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


"" Key remaps:

" my own remaps

inoremap fd <Esc> 
inoremap df <Esc>
nnoremap ; :
nnoremap : ;
"let mapleader=" "
map <Space> \ " somehow, this works better than solution above
map Y y$ 
imap <C-\> λ
nnoremap <F7> :TogglePencil <CR>
nnoremap <Backspace> :nohlsearch<CR>
nnoremap <C-e> 5<C-e>
nnoremap <C-y> 5<C-y>

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
map <leader>r :call RenameFile()<cr>


" Original content of the vimrc file.
set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction
