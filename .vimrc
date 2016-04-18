set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim' " let Vundle manage Vundle, required
Plugin 'flazz/vim-colorschemes'
Plugin 'tpope/vim-vinegar'
Plugin 'scrooloose/nerdcommenter'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'ervandew/supertab'
Plugin 'jiangmiao/auto-pairs' "adds automatic closing of stuff like brackets etc.
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'wlangstroth/vim-racket'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'reedes/vim-pencil'

call vundle#end()            " required
filetype plugin indent on    " required
set background=light " helps setting the right contrast
colorscheme solarized

syntax on
setglobal fileencoding=utf-8 bomb
set encoding=utf-8
let $LANG = 'en_US'
set nocompatible
set hidden " hides buffers instead of closing them - useful for editing a few files at the same time.
set tabstop=8       " this and two below probably unnecesary, think about deleting
set softtabstop=8
set shiftwidth=8
set expandtab
set relativenumber  " shows number of the column
set showcmd
set ruler
set ttyfast  " says to speed thing up a little bit
set autoindent " well, auto-indent:)
set cursorline          " sets line on the one where the cursor is
set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set ignorecase          " searches are case insensitive...
set novisualbell        " don't beep!
set noerrorbells
set nobackup            " doesn't create a backup file (annoying thing with tilda)
set noswapfile          " more-o-less the same stuff as one above.
set noundofile
set wildmenu            " this and the following set autocompition.
set wildmode=list:longest
set guioptions-=T       " set no toolbar in GUI version.
set guioptions+=m       " sets menubar in gVIm
set guifont=Anonymous\ Pro\ 21

" Plugins behaviour:
let g:airline#extensions#tabline#enabled = 1
set laststatus=2
let g:ctrlp_working_path_mode = 'ra' " Sets ctrlp working range to local root.
let g:SuperTabDefaultCompletionType ="context"
let g:goyo_width = 100
let g:pencil#autoformat = 1
let g:pencil#textwidth = 93

" Rainbow parentheses stuff

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


" Key remaps:
inoremap fd <Esc>
inoremap ff <Esc>
inoremap dd <Esc>
inoremap df <Esc>
nnoremap ; :
nnoremap : ;
map <Space> \
nnoremap <F7>  :TogglePencil <CR>
nnoremap <Leader>b :CtrlPBuffer<CR>
nnoremap <Leader>m :CtrlP<CR>
nnoremap <Backspace> :nohlsearch<CR>

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
